/*
 * Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com)
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
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

package io.ballerina.xsd.core.response;

import io.ballerina.compiler.syntax.tree.ModulePartNode;
import io.ballerina.xsd.core.context.NodeContext;
import io.ballerina.xsd.core.diagnostic.XSDDiagnostic;

import java.util.List;

/**
 * Represents a response that contains the generated syntax tree and associated diagnostics.
 *
 * @param types       The generated types as a {@link ModulePartNode} representation.
 * @param diagnostics A list of {@link XSDDiagnostic} objects containing any diagnostic
 *                    messages related to the XSD processing.
 * @param nodeContext     The {@link NodeContext} used during the generation of the syntax tree.
 * @since 0.1.0
 */
public record NodeResponse(ModulePartNode types, List<XSDDiagnostic> diagnostics, NodeContext nodeContext) { }
