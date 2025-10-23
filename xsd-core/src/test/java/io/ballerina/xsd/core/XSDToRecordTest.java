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

package io.ballerina.xsd.core;

import io.ballerina.xsd.core.response.Response;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.testng.Assert;
import org.w3c.dom.Document;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

import static io.ballerina.xsd.core.XSDToRecord.parseXSD;

public class XSDToRecordTest {
    private static final Path RES_DIR = Paths.get("src/test/resources/").toAbsolutePath();
    private static final String XML_DIR = "xml";
    private static final String EXPECTED_DIR = "expected";

    private static Stream<Object[]> provideTestPaths() {
        return Stream.of(
            new Object[] {"1_simple_type_with_restrictions.xml", "1_simple_type_with_restrictions.bal"},
            new Object[] {"2_simple_type_with_enumerations.xml", "2_simple_type_with_enumerations.bal"},
            new Object[] {"3_simple_type_with_unions.xml", "3_simple_type_with_unions.bal"},
            new Object[] {"4_elements_simple.xml", "4_elements_simple.bal"},
            new Object[] {"5_elements_with_simple_type.xml", "5_elements_with_simple_type.bal"},
            new Object[] {"6_elements_with_complex_type.xml", "6_elements_with_complex_type.bal"},
            new Object[] {"7_elements_with_choice.xml", "7_elements_with_choice.bal"},
            new Object[] {"8_elements_with_sequence.xml", "8_elements_with_sequence.bal"},
            new Object[] {"9_complex_type_with_nested_fields.xml", "9_complex_type_with_nested_fields.bal"},
            new Object[] {"10_complex_type_with_extensions.xml", "10_complex_type_with_extensions.bal"},
            new Object[] {"11_complex_type_with_extensions.xml", "11_complex_type_with_extensions.bal"},
            new Object[] {"12_elements_with_default_values.xml", "12_elements_with_default_values.bal"},
            new Object[] {"13_elements_with_fixed_values.xml", "13_elements_with_fixed_values.bal"},
            new Object[] {"14_elements_with_multiple_complex_types.xml", "14_elements_with_multiple_complex_types.bal"},
            new Object[] {"15_elements_with_occurrences.xml", "15_elements_with_occurrences.bal"},
            new Object[] {"16_elements_with_required_fields.xml", "16_elements_with_required_fields.bal"},
            new Object[] {"17_simple_type_with_extensions.xml", "17_simple_type_with_extensions.bal"},
            new Object[] {"18_complex_schema.xsd", "18_complex_schema.bal"},
            new Object[] {"19_complex_type_with_extensions.xml", "19_complex_type_with_extensions.bal"},
            new Object[] {"20_elements_with_attributes.xml", "20_elements_with_attributes.bal"},
            new Object[] {"21_attributes_with_default_values.xml", "21_attributes_with_default_values.bal"},
            new Object[] {"22_attributes_with_fixed_values.xml", "22_attributes_with_fixed_values.bal"},
            new Object[] {"23_complex_schema.xsd", "23_complex_schema.bal"},
            new Object[] {"24_complex_schema.xsd", "24_complex_schema.bal"},
            new Object[] {"25_complex_schema.xsd", "25_complex_schema.bal"},
            new Object[] {"26_complex_schema.xsd", "26_complex_schema.bal"},
            new Object[] {"27_complex_schema.xsd", "27_complex_schema.bal"},
            new Object[] {"28_complex_schema.xsd", "28_complex_schema.bal"},
            new Object[] {"29_element_with_same_type_name.xsd", "29_element_with_same_type_name.bal"},
            new Object[] {"30_complex_type_with_nested_choices.xsd", "30_complex_type_with_nested_choices.bal"},
            new Object[] {"31_elements_with_choice.xsd", "31_elements_with_choice.bal"},
            new Object[] {"32_elements_with_imports.xsd", "32_elements_with_imports.bal"},
            new Object[] {"33_elements_with_simple_types.xml", "33_elements_with_simple_types.bal"},
            new Object[] {"34_elements_with_simple_types.xml", "34_elements_with_simple_types.bal"},
            new Object[] {"35_unions_of_simple_types.xsd", "35_unions_of_simple_types.bal"},
            new Object[] {"36_elements_with_byte_type.xsd", "36_elements_with_byte_type.bal"},
            new Object[] {"37_elements_with_nested_complex_type.xml", "37_elements_with_nested_complex_type.bal"},
            new Object[] {"38_elements_with_double_values.xml", "38_elements_with_double_values.bal"}
        );
    }

    @ParameterizedTest
    @MethodSource("provideTestPaths")
    void testXsdToRecord(String xmlFilePath, String balFilePath) throws Exception {
        validate(RES_DIR.resolve(XML_DIR).resolve(xmlFilePath), RES_DIR.resolve(EXPECTED_DIR).resolve(balFilePath));
    }

    private void validate(Path sample, Path expected) throws Exception {
        String xmlFileContent = Files.readString(sample);
        Document document = parseXSD(xmlFileContent);
        Response result = XSDToRecord.convert(document);
        Assert.assertTrue(result.diagnostics().isEmpty());
        String expectedValue = Files.readString(expected);
        Assert.assertEquals(result.types(), expectedValue);
    }
}
