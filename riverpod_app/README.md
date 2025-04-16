# Flutter Testing Concepts - riverpod
This is a practice project for a Flutter app that allows users to view mock concepts and challenges.

## Domain model
The domain model is defined in the `lib/domain` folder based on the following data diagram:

![Data diagram](./data-diagram.svg)

## Project structure
- `lib/domain`: contains the domain models.
- `lib/data`: contains the data access layer including repositories and data sources.
- `lib/features`: contains the business logic and UI for the app.
- `test`: contains the tests for the app in the same structure as the `lib` folder.

### Features
- `concepts`: Displays a list of concepts.
- `concept`: Displays the sections of a concept.
- `challenges`: Displays the list of challenges for a concept.

## Core Packages
- `flutter_riverpod`: Used for state management.
- `retrofit` and `dio`: Used for the API client.
- `freezed`: Used for the data models.
- `go_router`: Used for typed navigation.

## Continuous Integration
GitHub Actions is used for the Continuous Integration pipeline.
- Code formatting is checked using `dart format`.
- Code analysis is done using `dart analyze`.
- 100% test coverage is enforced.
- PR title is checked to have correct semantics, e.g. `fix: <description>` or `feat: <description>`.
- Spell checking is done using `cSpell`.
