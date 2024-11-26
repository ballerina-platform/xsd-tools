import io.ballerina.xsd.cmd.XsdCmd;
import org.junit.Test;
import picocli.CommandLine;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class XsdCmdTest {

    @Test
    public void testExecuteWithArguments() throws IOException {
        ByteArrayOutputStream outContent = new ByteArrayOutputStream();
        ByteArrayOutputStream errContent = new ByteArrayOutputStream();
        System.setOut(new PrintStream(outContent));
        System.setErr(new PrintStream(errContent));

        XsdCmd xsdCmd = new XsdCmd();
        String[] args = {"-i", "src/test/resources/complex_schema_1.xsd", "-o", "src/test/resources/complex_schema_1" +
                ".bal"};
        new CommandLine(xsdCmd).parseArgs(args);
        xsdCmd.execute();

        String outputFileContent = Files.readString(Path.of("src/test/resources/complex_schema_1.bal"));
        String expectedContent = Files.readString(Path.of("src/test/resources/expected.bal"));
        assertEquals(outputFileContent, expectedContent);

        File file = new File("src/test/resources/complex_schema_1.bal");
        file.delete();
        System.setOut(System.out);
        System.setErr(System.err);
    }
}
