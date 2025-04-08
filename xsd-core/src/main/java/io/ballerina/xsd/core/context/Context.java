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
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerina.xsd.core.context;

import io.ballerina.compiler.syntax.tree.ModuleMemberDeclarationNode;
import io.ballerina.xsd.core.node.Kind;

/**
 * Represents a context for managing syntax tree nodes and their associated elements.
 */
public interface Context {

    /**
     * Retrieves a syntax tree node for the given element and kind.
     *
     * @param element The name of the element for which the syntax tree node is required.
     * @param kind The kind of the element.
     * @return A {@link ModuleMemberDeclarationNode} representing the syntax tree node.
     */
    ModuleMemberDeclarationNode getSyntaxTreeNode(String element, Kind kind);
}
