package io.ballerina.xsd.core;

import io.ballerina.xsd.core.diagnostic.XsdDiagnostic;

import java.util.ArrayList;
import java.util.List;

public class Response {
    private final String types;
    private List<XsdDiagnostic> diagnostics = new ArrayList<>();

    public Response(String types, List<XsdDiagnostic> diagnostics) {
        this.types = types;
        this.diagnostics = diagnostics;
    }

    public String getTypes() {
        return types;
    }

    public List<XsdDiagnostic> getDiagnostics() {
        return diagnostics;
    }

    public void setDiagnostics(List<XsdDiagnostic> diagnostics) {
        this.diagnostics = diagnostics;
    }
}
