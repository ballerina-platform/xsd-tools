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

package io.ballerina.xsdtorecordconverter;

import io.ballerina.xsdtorecordconverter.component.ComplexType;
import io.ballerina.xsdtorecordconverter.component.Element;
import io.ballerina.xsdtorecordconverter.component.IComponent;
import io.ballerina.xsdtorecordconverter.component.SimpleType;
import org.w3c.dom.Node;

import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitor.COMPLEX_TYPE;
import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitor.ELEMENT;
import static io.ballerina.xsdtorecordconverter.visitor.XSDVisitor.SIMPLE_TYPE;

/**
 * The factory class for generating XSD components.
 */
public final class XSDFactory {
    public static IComponent generateComponents(Node node) {
        if (node.getNodeType() != Node.ELEMENT_NODE) {
            return null;
        }
        switch (node.getLocalName()) {
            case ELEMENT -> {
                return new Element(node);
            }
            case COMPLEX_TYPE -> {
                return new ComplexType(node);
            }
            case SIMPLE_TYPE -> {
                return new SimpleType(node);
            }
            default -> {
                return null;
            }
        }
    }
}
