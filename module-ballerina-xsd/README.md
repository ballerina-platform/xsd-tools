## Package Overview

`XSD` (XML Schema Definition) is an approach to define the structure, elements, and constraints of XML documents. It is widely used for validating the content and structure of XML files.

The Ballerina XSD Tool simplifies the generation of Ballerina record types from an XSD specification, improving the user experience when integrating with XML-based operations in Ballerina.

### Supported XSD Features

The tool supports the following XSD elements and constructs:

| Feature | Description | Ballerina Mapping |
|---------|-------------|-------------------|
| `xs:element` | Element definitions | Record fields |
| `xs:complexType` | Complex type definitions | Ballerina records |
| `xs:simpleType` | Simple type definitions | Type aliases |
| `xs:sequence` | Ordered element groups | Sequence records with `@xmldata:Sequence` |
| `xs:choice` | Choice element groups | Choice records with `@xmldata:Choice` |
| `xs:all` | Unordered element groups | Records with all fields |
| `xs:attribute` | Attributes | Fields with `@xmldata:Attribute` |
| `xs:attributeGroup` | Reusable attribute groups | Expanded inline as attributes |
| `xs:extension` | Type extensions | Record extension |
| `xs:restriction` | Type restrictions | Constrained types |
| `xs:enumeration` | Enumeration values | Ballerina enums |
| `xs:any` | Wildcard elements | `@xmldata:Any`-annotated field of type `anydata` or union of known element/complex-type records |
| `xs:include` | Schema includes | Multi-file processing |

### Installation

Execute the command below to pull the XSD tool from Ballerina Central.

```bash
$ bal tool pull xsd:1.0.2
```

### Usage

The XSD tool allows you to generate Ballerina record types from an XSD specification.

To generate Ballerina types, use the following command. It is mandatory to run the command inside a Ballerina project.

```bash
$ bal xsd <xsd-file-path> 
          [--module <output-module-name>]
```

#### Command options  

| Option | Description | Mandatory/Optional |
|--------|-------------|--------------------|
| `<xsd-file-path>` | The path to the XSD file | Mandatory |
| `-m`, `--module`   | The name of the module in which the Ballerina record types are generated | Optional |

### Generate types for the given XSD file

Use the following command to generate Ballerina record types for all elements defined in the specified XSD file. By default, the generated `types.bal` file will be placed in the default module of the current Ballerina project.

```bash
$ bal xsd <source-file-path>
```

For example,

```bash
$ bal xsd sample.xsd
```

If the execution is successful, the following output will be displayed.

```bash
The 'types.bal' file is written to the default module
```

The generated files will include,

```bash
types.bal
```

#### Generate types in a specific module

To generate the Ballerina record types in a specific module, use the `--module` option.

```bash
$ bal xsd <source-file-path> --module <output-module-name>
```

For example,

```bash
$ bal xsd sample.xsd --module custom
```

This will generate a `types.bal` file inside the `custom` submodule within the Ballerina project.

Upon successful execution, the following output will be displayed.

```bash
The 'types.bal' file is written to 'modules/custom'
```

The generated files will include,

```bash
modules/
└── custom/
        └── types.bal
```
