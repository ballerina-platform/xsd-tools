/*
 * Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com)
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerina.xsd.cmd;

import io.ballerina.xsd.core.Response;
import io.ballerina.xsd.core.XSDToRecord;
import org.w3c.dom.Document;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import picocli.CommandLine;
import io.ballerina.cli.BLauncherCmd;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Scanner;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import static io.ballerina.xsd.core.visitor.XSDVisitorImpl.EMPTY_STRING;

/**
 * Main class to implement "xsd" command for ballerina.
 */
@CommandLine.Command(
        name = "xsd",
        description = "Generates Ballerina records for XSD specification"
)
public class XsdCmd implements BLauncherCmd {
    private static final String CMD_NAME = "xsd";
    private static final String FILE_OVERWRITE_PROMPT = "File already exists at %s. Overwrite? (y/N): ";
    public static final String INVALID_BALLERINA_DIRECTORY_ERROR =
            "Invalid Ballerina package directory: %s, cannot find 'Ballerina.toml' file";
    public static final String INVALID_DIRECTORY_PATH = "Error: Invalid directory path has been provided. " +
            "Output path '%s' is a file";
    public static final String TYPES_FILE_NAME = "types.bal";
    public static final String SLASH = "/";
    private final PrintStream outStream;
    private final boolean exitWhenFinish;
    @CommandLine.Option(names = {"-h", "--help"}, hidden = true)
    private boolean helpFlag;

    @CommandLine.Parameters(description = "Input file path of the XSD schema")
    private final List<String> argList = new ArrayList<>();

    @CommandLine.Option(names = {"-m", "--module"}, description = "The name of the module in which the Ballerina " +
            "client and record types are generated.")
    private String outputPath = "";

    public XsdCmd() {
        this.outStream = System.err;
        this.exitWhenFinish = true;
    }

    @Override
    public void execute() {
        if (this.helpFlag) {
            StringBuilder stringBuilder = new StringBuilder();
            printLongDesc(stringBuilder);
            outStream.println(stringBuilder);
            return;
        }
        Path currentDir = Paths.get("").toAbsolutePath();
        Path commandPath = currentDir.resolve("Ballerina.toml");
        if (!Files.exists(commandPath)) {
            outStream.printf((INVALID_BALLERINA_DIRECTORY_ERROR) + "%n", commandPath);
            exitOnError();
            return;
        }
        Path outputDirPath = Paths.get(outputPath);
        if (!Objects.equals(outputPath, EMPTY_STRING)) {
            Path basePath = Paths.get("modules").toAbsolutePath();
            outputDirPath = basePath.resolve(outputPath).normalize();
            if (!outputDirPath.startsWith(basePath)) {
                System.out.printf("Invalid output path: Path traversal detected in '%s'%n", outputPath);
                exitOnError();
                return;
            }
        }
        if (Files.exists(outputDirPath) && !Files.isDirectory(outputDirPath)) {
            outStream.printf((INVALID_DIRECTORY_PATH) + "%n", outputPath);
            exitOnError();
            return;
        }
        if (argList.isEmpty()) {
            outStream.println("An XSD file path is required to generate the types");
            outStream.println("e.g: bal xsd <xsd source file path>");
            exitOnError();
            return;
        }
        try {
            if (!Files.exists(Path.of(argList.get(0)))) {
                outStream.println(argList.get(0) + " file does not exist.");
                return;
            }
            String xmlFileContent = Files.readString(Path.of(argList.get(0)));
            Document document = parseXSD(xmlFileContent);
            Response result = XSDToRecord.convert(document);
            if (!result.diagnostics().isEmpty()) {
                result.diagnostics().forEach(xsdDiagnostic -> outStream.println(xsdDiagnostic.toString()));
                exitOnError();
                return;
            }
            Path path;
            if (outputPath.equals(EMPTY_STRING)) {
                path = Path.of(TYPES_FILE_NAME);
            } else {
                path = outputDirPath.resolve(SLASH).resolve(TYPES_FILE_NAME);
            }
            Path destinationFile = Files.exists(path) ? handleFileOverwrite(path, outStream) : path;
            Path parentDirectory = destinationFile.getParent();
            if (parentDirectory != null && !Files.exists(parentDirectory)) {
                Files.createDirectories(parentDirectory);
            }
            Files.writeString(destinationFile, result.types());
            outStream.println("Output is successfully written to " + destinationFile);
        } catch (ParserConfigurationException | SAXException e) {
            outStream.println("XSD file contains errors. " + e.getLocalizedMessage());
        } catch (IOException e) {
            outStream.println("Error occurred while accessing the file. " + e.getLocalizedMessage());
        } catch (Exception e) {
            outStream.println("Error: " + e.getLocalizedMessage());
            exitOnError();
        }
    }

    public static Path handleFileOverwrite(Path destinationFile, PrintStream outStream) {
        if (!Files.exists(destinationFile)) {
            return destinationFile;
        }
        String filePath = destinationFile.toString();
        outStream.printf(FILE_OVERWRITE_PROMPT, filePath);
        String response = new Scanner(System.in).nextLine().trim().toLowerCase();
        if (response.equals("y")) {
            return destinationFile;
        }
        int counter = 1;
        String fileName = new File(filePath).getName();
        int dotIndex = fileName.lastIndexOf('.');
        String baseName = dotIndex == -1 ? fileName : fileName.substring(0, dotIndex);
        String extension = dotIndex == -1 ? EMPTY_STRING : fileName.substring(dotIndex);
        String parentPath = new File(filePath).getParent() != null ? new File(filePath).getParent() : EMPTY_STRING;
        while (Files.exists(destinationFile)) {
            String newFileName = baseName + "." + counter + extension;
            destinationFile = Path.of(parentPath, newFileName);
            counter++;
        }
        return destinationFile;
    }

    private static Document parseXSD(String xsdData) throws Exception {
        ByteArrayInputStream inputStream = new ByteArrayInputStream(xsdData.getBytes(StandardCharsets.UTF_8));
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        dbFactory.setNamespaceAware(true);
        DocumentBuilder docBuilder;
        try {
            docBuilder = dbFactory.newDocumentBuilder();
        } catch (ParserConfigurationException e) {
            throw new ParserConfigurationException(e.getLocalizedMessage());
        }
        docBuilder.setErrorHandler(new ErrorHandler() {
            @Override
            public void warning(SAXParseException exception) {
                throw new RuntimeException(exception);
            }

            @Override
            public void error(SAXParseException exception) {
                throw new RuntimeException(exception);
            }

            @Override
            public void fatalError(SAXParseException exception) {
                throw new RuntimeException(exception);
            }
        });
        try {
            return docBuilder.parse(inputStream);
        } catch (SAXException e) {
            throw new SAXException(e);
        } catch (IOException e) {
            throw new IOException(e);
        }
    }

    @Override
    public String getName() {
        return CMD_NAME;
    }

    @Override
    public void printLongDesc(StringBuilder outStream) {
        Class<?> clazz = XsdCmd.class;
        ClassLoader classLoader = clazz.getClassLoader();
        InputStream inputStream = classLoader.getResourceAsStream("cli-docs/xsd-help.help");
        if (inputStream != null) {
            try (InputStreamReader inputStreamREader = new InputStreamReader(inputStream, StandardCharsets.UTF_8);
                 BufferedReader br = new BufferedReader(inputStreamREader)) {
                String content = br.readLine();
                outStream.append(content);
                while ((content = br.readLine()) != null) {
                    outStream.append('\n').append(content);
                }
            } catch (IOException e) {
                outStream.append("Helper text is not available.");
            }
        }
    }

    @Override
    public void printUsage(StringBuilder stringBuilder) {
    }

    @Override
    public void setParentCmdParser(CommandLine parentCmdParser) {
    }

    private void exitOnError() {
        if (exitWhenFinish) {
            Runtime.getRuntime().exit(1);
        }
    }
}
