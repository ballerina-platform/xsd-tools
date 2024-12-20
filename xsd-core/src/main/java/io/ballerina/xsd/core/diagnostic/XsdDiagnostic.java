package io.ballerina.xsd.core.diagnostic;

import io.ballerina.tools.diagnostics.Diagnostic;
import io.ballerina.tools.diagnostics.DiagnosticInfo;
import io.ballerina.tools.diagnostics.DiagnosticProperty;
import io.ballerina.tools.diagnostics.DiagnosticSeverity;
import io.ballerina.tools.diagnostics.Location;

import java.text.MessageFormat;
import java.util.Collections;
import java.util.List;

public class XsdDiagnostic extends Diagnostic {
    private final DiagnosticInfo diagnosticInfo;
    private final Location location;
    private final List<DiagnosticProperty<?>> properties;
    private final String message;
    private final String severity;

    public XsdDiagnostic(String code, String message, DiagnosticSeverity severity,
                         Location location, Object[] args) {
        this.diagnosticInfo = new DiagnosticInfo(code, message, severity);
        this.location = location;
        this.properties = Collections.emptyList();
        this.message = MessageFormat.format(message, args);
        this.severity = severity.name();
    }

    @Override
    public Location location() {
        return this.location;
    }

    @Override
    public DiagnosticInfo diagnosticInfo() {
        return this.diagnosticInfo;
    }

    @Override
    public String message() {
        return this.message;
    }

    @Override
    public List<DiagnosticProperty<?>> properties() {
        return this.properties;
    }

    public String getSeverity() {
        return this.severity;
    }

    @Override
    public String toString() {
        String severity = this.diagnosticInfo().severity().toString();
        return "[" + severity + "] " + this.message();
    }
}
