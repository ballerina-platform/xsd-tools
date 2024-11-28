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

import org.w3c.dom.Node;

public class ComplexType implements IComponent {
    Node node;
    boolean isSubType;
    public ComplexType(Node node) {
        this.node = node;
        this.isSubType = false;
    }

    public Node getNode() {
        return node;
    }

    @Override
    public String accept(IXSDVisitor xsdVisitor) {
        if (isSubType) {
            return xsdVisitor.visit(this, true);
        }
        return xsdVisitor.visit(this);
    }

    @Override
    public void setSubType(boolean subType) {
        this.isSubType = subType;
    }

    @Override
    public boolean isSubType() {
        return this.isSubType;
    }
}
