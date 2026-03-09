# AGENTS.md

## Scope
These instructions apply to the entire repository.

## Project goal
This project is a personal website built with **Flutter Web** (Dart), published on GitHub Pages.

## Development standard (Flutter)
- Use **idiomatic Dart** and prioritize readability over overly complex solutions.
- Prefer small, reusable widgets; avoid putting too much logic directly inside `build`.
- Keep consistency with `analysis_options.yaml` and run `dart format` on changed files.
- Every code change must include or update **unit tests** that validate the altered behavior.
- Prioritize **TDD (Test Driven Development)**: write a failing test first, implement the change, and then refactor while keeping tests green.
- For relevant visual changes, validate locally on web (`flutter run -d chrome`) and include evidence when possible.

## Architecture standard
- Follow **Clean Architecture** principles for all new features.
- Keep clear separation of concerns between layers:
  - **Presentation/UI**: widgets, page state, and user interaction.
  - **Domain/Core**: business rules, entities, and use cases.
  - **Data**: repositories, data sources, and external integrations.
- Ensure dependencies point inward (UI -> Domain/Core <- Data abstractions).
- Avoid placing business rules directly in widgets or framework-specific code.

## Current project structure (must be followed in new features)
- Use the existing structure as the default for new work:
  - `lib/core/`: shared domain/core logic and cross-cutting concerns.
  - `lib/data/`: data/repository implementations and integrations.
  - `lib/ui/`: presentation layer (pages/widgets/view logic).
  - `test/`: unit and widget tests.
- New features should be added under these folders, preserving the same layering and naming patterns already used in the project.

## Feature workflow
For new features:
1. start with a failing automated test (preferably unit test) that describes the expected behavior;
2. implement UI/behavior in the appropriate layer;
3. add/update tests in `test/` to fully cover the change, ensuring at least one unit test for affected logic;
4. run `flutter test` before finishing.

## Quality checklist
Before completing changes, try to run:

```bash
flutter pub get
flutter analyze
flutter test
```

If any command cannot be run due to environment limitations, document it in the final summary.
