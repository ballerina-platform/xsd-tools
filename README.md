# Ballerina XSD Tool  

[![Build](https://github.com/ballerina-platform/xsd-tools/actions/workflows/build-timestamped-master.yml/badge.svg)](https://github.com/ballerina-platform/xsd-tools/actions/workflows/build-timestamped-master.yml)
[![codecov](https://codecov.io/gh/ballerina-platform/xsd-tools/branch/master/graph/badge.svg)](https://codecov.io/gh/ballerina-platform/xsd-tools)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/xsd-tools.svg)](https://github.com/ballerina-platform/xsd-tools/commits/master)
[![GitHub issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/xsd-tools.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fxsd-tools)

`XSD` (XML Schema Definition) is an approach to define the structure, elements, and constraints of XML documents. It is widely used for validating the content and structure of XML files.

The Ballerina XSD Tool simplifies the generation of Ballerina record types from an XSD specification, improving the user experience when integrating with XML-based operations in Ballerina.

### Installation

Execute the command below to pull the XSD tool from Ballerina Central.

```bash
$ bal tool pull xsd
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
| `<xsd-file-path>` | (Required) The path to the XSD file | Mandatory |
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

If successful, you will see the following output.

```bash
The 'types.bal' file is written to the default module
```

### Generate types for the given XSD files directory

Use the following command to generate Ballerina record types from all XSD files in a specified directory. The generated files will be placed in the default module of the current Ballerina project.

```bash
$ bal xsd --directory <directory-path>
```

For example,

```bash
$ bal xsd --directory inputs
```

If successful, it will generate a separate Ballerina file for each XSD file in the `inputs` directory.

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

The following output will be displayed.

```bash
The 'types.bal' file is written to 'modules/custom'
```

Upon successful execution, the generated files will include,

```bash
modules/
└── custom/
        └── types.bal
```

## Building from the Source

### Setting Up the Prerequisites

1. OpenJDK 21 ([Adopt OpenJDK](https://adoptopenjdk.net/) or any other OpenJDK distribution)

   >**Info:** You can also use [Oracle JDK](https://www.oracle.com/java/technologies/javase-downloads.html). Set the JAVA_HOME environment variable to the pathname of the directory into which you installed JDK.

2. Export GitHub Personal access token with read package permissions as follows,
   ```
   export packageUser=<Username>
   export packagePAT=<Personal access token>
   ```

### Building the Source

Execute the commands below to build from the source.

1. To build the library:

        ./gradlew clean build

2. To run the integration tests:

        ./gradlew clean test

3. To build the module without the tests:

        ./gradlew clean build -x test

4. To publish to maven local:

        ./gradlew clean build publishToMavenLocal

5. Publish the generated artifacts to the local Ballerina central repository:

        ./gradlew clean build -PpublishToLocalCentral=true

6. Publish the generated artifacts to the Ballerina central repository:

        ./gradlew clean build -PpublishToCentral=true

## Contributing to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

You can also check for [open issues](https://github.com/ballerina-platform/xsd-tools/issues) that
interest you. We look forward to receiving your contributions.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of Conduct

All contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful Links

* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
* View the [Ballerina performance test results](https://github.com/ballerina-platform/ballerina-lang/blob/master/performance/benchmarks/summary.md).
