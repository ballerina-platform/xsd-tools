# Change Log

This file contains all the notable changes done to the Ballerina XSD Tool package through the releases.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- [Add element annotation to record fields](https://github.com/ballerina-platform/xsd-tools/pull/40)
- Set the maximum maxOccurs value to 65535

### Fixed

- [Support NMTOKENS as built-in type](https://github.com/ballerina-platform/xsd-tools/pull/38)
- Fix optional field generation for sequence groups
- Handle ambiguity when a single element inside a sequence
- Fix setting attributes and content fields optional
- Set sequenceGroup optional when all child elements are optional

## [1.2.0] - 2025-02-02

### Added

- [Add support for xs:include, attributeGroup, annotation, xs:any](https://github.com/ballerina-platform/xsd-tools/pull/35)
- Handle enum types
- Add xmldata:Any annotation for any elements

### Fixed

- Fix supporting minOccurs in anyElement
- Fix adding nil value to anydata type
- Improve the method to extract restriction base

## [1.1.2] - 2024-10-24

### Added

- Add support for converting keywords in XSD
- Support converting all floating point values

### Fixed

- Fix supporting double values
- Handle built-in types for the proper format

## [1.1.1] - 2024-08-05

### Fixed

- Fix substituting values in root elements

## [1.1.0] - 2024-07-23

### Added

- Add support to get resolved name metadata
- Export node package
- Add new record class to represent an XSD element
- Add new class to represent a node in the syntax tree
- Add enum for categorizing XSD components
- Add record to include syntax tree and diagnostics

### Fixed

- Fix XSD Element being used for record field type
- Fix not generating directories for a single XSD file
- Handle NPE when processing XSD elements
- Fix getting invalid types with the name anydata

## [1.0.8] - 2024-04-02

### Fixed

- Fix returning error when directly using help flag
