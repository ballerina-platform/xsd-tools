# Ballerina XSD Tool  

[![Build](https://github.com/ballerina-platform/xsd-tools/actions/workflows/build-timestamped-master.yml/badge.svg)](https://github.com/ballerina-platform/xsd-tools/actions/workflows/build-timestamped-master.yml)
[![codecov](https://codecov.io/gh/ballerina-platform/xsd-tools/branch/master/graph/badge.svg)](https://codecov.io/gh/ballerina-platform/xsd-tools)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/xsd-tools.svg)](https://github.com/ballerina-platform/xsd-tools/commits/master)
[![GitHub issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/module/xsd-tools.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fxsd-tools)

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
