package io.ballerina.xsd.core.diagnostic;

import io.ballerina.tools.diagnostics.DiagnosticSeverity;

import java.util.Objects;

public class DiagnosticMessage {
    private final String code;
    private final String description;
    private final DiagnosticSeverity severity;
    private final Object[] args;

    private DiagnosticMessage(String code, String description, DiagnosticSeverity severity, Object[] args) {
        this.code = code;
        this.description = description;
        this.severity = severity;
        this.args = args;
    }

    public String getCode() {
        return this.code;
    }

    public String getDescription() {
        return this.description;
    }

    public DiagnosticSeverity getSeverity() {
        return this.severity;
    }

    public Object[] getArgs() {
        return Objects.requireNonNullElse(this.args, new Object[0]).clone();
    }

    public static XsdDiagnostic xsdToBallerinaError100(Object[] args) {
        return new XsdDiagnostic("XSD_TO_BALLERINA_100",
                "Invalid XSD. Provided XSD is invalid.", DiagnosticSeverity.ERROR, null, args);
    }

    public static XsdDiagnostic xsdToBallerinaError101(Exception e, Object[] args) {
        return new XsdDiagnostic("XSD_TO_BALLERINA_101",
                String.format("The content of the XSD is not supported. %s", e.getMessage()),
                DiagnosticSeverity.ERROR, null, args);
    }

    public static XsdDiagnostic xsdToBallerinaError102(String attribute, Object[] args) {
        return new XsdDiagnostic("XSD_TO_BALLERINA_102",
                String.format(String.format("The expected attribute is not provided: %s", attribute)),
                DiagnosticSeverity.ERROR, null, args);
    }
}