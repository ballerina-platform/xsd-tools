# PR #38 Summary: Support NMTOKENS as Built-in Type

## Fixes Made

- Added support for `NMTOKENS` XSD built-in type, mapping it to Ballerina `string` type
- Added support for `ENTITY` and `ENTITIES` XSD built-in types, mapping them to Ballerina `string` type  
- Added support for `Name` XSD built-in type, mapping it to Ballerina `string` type
- Updated the `typeGenerator()` method to handle the new string-based XSD types
- Added test case 44 to validate built-in string types conversion (NMTOKENS, ENTITY, ENTITIES, Name)
