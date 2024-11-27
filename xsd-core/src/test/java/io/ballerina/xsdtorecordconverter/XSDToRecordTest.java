package io.ballerina.xsdtorecordconverter;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.testng.Assert;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

public class XSDToRecordTest {
    private static final Path RES_DIR = Paths.get("src/test/resources/").toAbsolutePath();
    private static final String XML_DIR = "xml";
    private static final String EXPECTED_DIR = "expected";

    private static Stream<Object[]> provideTestPaths() {
        return Stream.of(
            new Object[] {"attributes.xml", "attributes.bal"},
            new Object[] {"attributes_with_default_values.xml", "attributes_with_default_values.bal"},
            new Object[] {"attributes_with_fixed_values.xml", "attributes_with_fixed_values.bal"},
            new Object[] {"complex_schema_1.xsd", "complex_schema_1.bal"},
            new Object[] {"complex_schema_2.xsd", "complex_schema_2.bal"},
            new Object[] {"complex_schema_3.xsd", "complex_schema_3.bal"},
            new Object[] {"complex_schema_4.xsd", "complex_schema_4.bal"},
            new Object[] {"complex_schema_5.xsd", "complex_schema_5.bal"},
            new Object[] {"complex_schema_6.xsd", "complex_schema_6.bal"},
            new Object[] {"complex_schema_7.xsd", "complex_schema_7.bal"},
            new Object[] {"complex_type_with_extensions.xml", "complex_type_with_extensions.bal"},
            new Object[] {"elements_simple.xml", "elements_simple.bal"},
            new Object[] {"elements_with_complex_type.xml", "elements_with_complex_type.bal"},
            new Object[] {"elements_with_multiple_complex_types.xml", "elements_with_multiple_complex_types.bal"},
            new Object[] {"elements_with_sequence.xml", "elements_with_sequence.bal"},
            new Object[] {"elements_with_required_fields.xml", "elements_with_required_fields.bal"},
            new Object[] {"elements_with_choice.xml", "elements_with_choice.bal"},
            new Object[] {"elements_with_occurrences.xml", "elements_with_occurrences.bal"},
            new Object[] {"elements_with_default_values.xml", "elements_with_default_values.bal"},
            new Object[] {"elements_with_fixed_values.xml", "elements_with_fixed_values.bal"},
            new Object[] {"simple_type_with_restrictions.xml", "simple_type_with_restrictions.bal"},
            new Object[] {"simple_type_with_extensions.xml", "simple_type_with_extensions.bal"},
            new Object[] {"simple_type_with_enumerations.xml", "simple_type_with_enumerations.bal"}
        );
    }

    @ParameterizedTest
    @MethodSource("provideTestPaths")
    void testXsdToRecord(String xmlFilePath, String balFilePath) throws IOException {
        validate(RES_DIR.resolve(XML_DIR).resolve(xmlFilePath), RES_DIR.resolve(EXPECTED_DIR).resolve(balFilePath));
    }

    private void validate(Path sample, Path expected) throws IOException {
        String xmlFileContent = Files.readString(sample);
        String result = XSDToRecord.convert(xmlFileContent);
        String expectedValue = Files.readString(expected);
        Assert.assertEquals(result, expectedValue);
    }

    @org.junit.jupiter.api.Test
    void testXsdSchema() throws IOException {
        String sourceFile = "simple_type_with_restrictions.xml";
        String xmlFileContent = Files.readString(RES_DIR.resolve(XML_DIR).resolve(sourceFile));
        String result = XSDToRecord.convert(xmlFileContent);
//        Path destinationFile = Paths.get(sourceFile.replace(".xsd", ".bal"));
//        Files.writeString(destinationFile, result);
        System.out.println(result);
    }
}
