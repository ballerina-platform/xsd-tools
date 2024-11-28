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

import io.ballerina.xsdtorecordconverter.XSDToRecord;
import picocli.CommandLine;
import io.ballerina.cli.BLauncherCmd;

import java.io.BufferedReader;
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

/**
 * Main class to implement "xsd" command for ballerina.
 */
@CommandLine.Command(
        name = "xsd",
        description = "Generates Ballerina records for XSD specification"
)
public class XsdCmd implements BLauncherCmd {
    private static final String CMD_NAME = "xsd";
    private final PrintStream outStream;
    private final boolean exitWhenFinish;
    @CommandLine.Option(names = {"-h", "--help"}, hidden = true)
    private boolean helpFlag;

    @CommandLine.Parameters(description = "Program arguments")
    private final List<String> argList = new ArrayList<>();

    @CommandLine.Option(names = {"-o", "--output"}, description = "Generating the types from the XSD file")
    private String outputPath = "types.bal";

    public XsdCmd() {
        this.outStream = System.err;
        this.exitWhenFinish = true;
    }

    @Override
    public void execute() {
        if (this.helpFlag) {
            StringBuilder stringBuilder = new StringBuilder();
            printLongDesc(stringBuilder);
            System.out.println(stringBuilder);
            return;
        }
        if (argList.isEmpty()) {
            outStream.println("Missing input xsd file");
            exitOnError();
            return;
        }
        try {
            String xmlFileContent = Files.readString(Path.of(argList.get(0)));
            String result = XSDToRecord.convert(xmlFileContent);
            Path destinationFile = Paths.get(outputPath);
            Files.writeString(destinationFile, result);
            System.out.println("Processing completed. Output written to " + outputPath);
        } catch (Exception e) {
            outStream.println("Error: " + e.getLocalizedMessage());
            exitOnError();
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
