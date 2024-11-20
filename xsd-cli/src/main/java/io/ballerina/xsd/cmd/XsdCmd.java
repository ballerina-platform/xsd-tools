package io.ballerina.xsd.cmd;

import io.ballerina.xsdtorecordconverter.XSDToRecord;
import picocli.CommandLine;
import io.ballerina.cli.BLauncherCmd;

import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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

    @CommandLine.Option(names = {"-i", "--input"}, description = "Input the XSD file")
    private String inputPath;

    @CommandLine.Option(names = {"-o", "--output"}, description = "Generating the types from the XSD file")
    private String outputPath;

    public XsdCmd() {
        this.outStream = System.err;
        this.exitWhenFinish = true;
    }

    @Override
    public void execute() {
        if (this.helpFlag) {
            System.out.println("This is help");
            return;
        }
        if (inputPath == null || inputPath.isBlank()) {
            outStream.println("error");
            exitOnError();
            return;
        }

        try {
            String xmlFileContent = Files.readString(Path.of(inputPath));
            String result = XSDToRecord.convert(xmlFileContent);

            Path destinationFile = Paths.get(outputPath);
            Files.writeString(destinationFile, result);
            System.out.println("Processing completed. Output written to " + outputPath);
        } catch (Exception e) {
            outStream.println("Error: " + e.getLocalizedMessage());
            exitOnError();
        }
        // implementation logic goes here
    }

    @Override
    public String getName() {
        return CMD_NAME;
    }

    @Override
    public void printLongDesc(StringBuilder out) {
        // The value of the stringBuilder will be printed
        // in bal help openapi cmd
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