## Overview

`XSD` (XML Schema Definition) is an approach to define the structure, elements, and constraints of XML documents. It is widely used for validating the content and structure of XML files.

The Ballerina XSD Tool simplifies the process of generating Ballerina record types from an XSD specification. These generated types helps to integrate with XML-based operations in Ballerina.

### Command Syntax

The `xsd` command in Ballerina is used for XSD to Ballerina code generation.  

```bash
bal xsd <xsd-file-path> [--module <output-module-name>]
```

#### Command Options  

| Option | Description |
|--------|-------------|
| `<xsd-file-path>` | (Required) The path to the XSD file |
| `-m`, `--module`   | The name of the module in which the Ballerina record types are generated |

### Examples

#### 1. Generate types for the given XSD file

This command generates Ballerina record types for all the elements defined in the specified XSD file. The generated files will be placed in the current Ballerina project.

```bash
bal xsd <source-file-path>
```

#### 2. Generate types in a specific module

To generate the Ballerina record types in a specific module, use the `--module` option.

```bash
bal xsd <source-file-path> --module custom 
```
