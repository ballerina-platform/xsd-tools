/*
 * Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com)
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

package io.ballerina.xsd.core.context;

import io.ballerina.compiler.syntax.tree.ModuleMemberDeclarationNode;
import io.ballerina.xsd.core.node.Kind;
import io.ballerina.xsd.core.node.MemberNode;
import io.ballerina.xsd.core.node.XSDElement;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Represents the context for processing XSD elements.
 * This class provides methods to manage and retrieve syntax tree nodes and XSD elements.
 */
public final class XSDContext implements Context {
     private final Map<String, MemberNode> nodes = new HashMap<>();
     private final Map<String, XSDElement> nameResolvers = new HashMap<>();

    public XSDContext(Map<String, MemberNode> nodes, Map<String, XSDElement> nameResolvers) {
        this.nodes.putAll(nodes);
        this.nameResolvers.putAll(nameResolvers);
    }

    public static <K, V> K getKeyByValue(Map<K, V> map, V value) {
        for (Map.Entry<K, V> entry : map.entrySet()) {
            if (Objects.equals(value, entry.getValue())) {
                return entry.getKey();
            }
        }
        return null;
    }

    @Override
    public ModuleMemberDeclarationNode getSyntaxTreeNode(String element, Kind kind) {
        List<MemberNode> memberNodeList = new ArrayList<>();
        if (nodes.containsKey(element)) {
            memberNodeList.add(nodes.get(element));
        }
        Collection<XSDElement> elements = nameResolvers.values();
        for (XSDElement xsdElement : elements) {
            if (Objects.equals(xsdElement.type(), element)) {
                String key = getKeyByValue(nameResolvers, xsdElement);
                if (key != null && nodes.containsKey(key)) {
                    memberNodeList.add(nodes.get(key));
                }
            }
        }
        return memberNodeList.stream()
                .filter(memberNode -> memberNode.kind() == kind)
                .findFirst()
                .map(MemberNode::node)
                .orElse(null);
    }
}
