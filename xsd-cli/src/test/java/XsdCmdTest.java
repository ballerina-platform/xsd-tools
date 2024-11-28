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

import io.ballerina.xsd.cmd.XsdCmd;
import org.junit.Test;
import picocli.CommandLine;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.Assert.assertEquals;

public class XsdCmdTest {

    @Test
    public void testExecuteWithArguments() throws IOException {
        ByteArrayOutputStream outContent = new ByteArrayOutputStream();
        ByteArrayOutputStream errContent = new ByteArrayOutputStream();
        System.setOut(new PrintStream(outContent));
        System.setErr(new PrintStream(errContent));

        XsdCmd xsdCmd = new XsdCmd();
        String[] args = {"src/test/resources/complex_schema_1.xsd", "-o", "src/test/resources/complex_schema_1" +
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
