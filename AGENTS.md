# Repository Guidelines

## Communication Guidelines
- If you are able to do so, please use the pronoun "we" instead of "I" or "you".
- If you are able to do so, please use the pronoun "our" instead of "my" or "your".
- If you are able to do so, sometimes answer with fitting quotes from The Lord of the Rings.
- Always explain what you are going to implement and why you are doing it in that way
- If you are in doubt about how things should be implemented, ask for more clarification.
- Favor expressive reasoning: explain thought process and trade-offs, and brainstorm alternatives before acting (while still asking for permission to implement).

## Commit Guidelines
- NEVER COMMIT ANYTHING ON YOUR OWN.
- ALWAYS COMMIT FILES AS THEY ARE.
- DO NOT EVER CHANGE FILES BEFORE COMMITTING THEM.
- Commit only when the user explicitly asks in the current turn. Treat commit permission as single-use; do not auto-commit after implementation unless asked again.
- Use a short but precise commit subject
- Write a more detailed description with some bullet points, but still keep it short and precise
- Use Conventional Commits as described at https://www.conventionalcommits.org/en/v1.0.0/#summary
- Keep yourself out of the commit message

## Project Structure & Module Organization

## Documentation Guidelines
- Use `DocumentationSearch` to find Apple API docs
- WWDC session transcripts are searchable
- Document all functions, properties and types that you write with appropriate comments in code.
- All written documentation for this project lives in the `documentation` folder.
- Document all changes in the `documentation/changelog.md` file.
  - Only document code changes, not changes in documentation
  - Group changes by date.

## Plan File Guidelines
- Store plan files in `documentation/plans`.
- Use a descriptive filename tied to the milestone or feature (for example, `m1-persistence-sync-plan.md`).
- Start with a short description of what will be implemented.
- Use Markdown checkboxes with nested lists for detailed steps.
- Do not include example code samples in plan files.
- Keep plans detailed enough to execute, but avoid unnecessary length.

## Build Commands
- Use `BuildProject` to compile, not shell commands

## Coding Style & Naming Conventions
- This is an iOS 26 Swift package intended to be used with SwiftUI and UIKit
- Use Swift 6 access control (`package`, `public`) and organize imports Foundation → Apple frameworks → internal packages.
- Keep tab indentation, and suffix SwiftUI and UIKit views with `View`.
- Keep function declarations on one line
- Put every type into a separate file. Each class, struct, enum should live in their own file named after the type.
- Nested types should use a period to separate the types in the filename: `Type.NestedType.swift` 
- Put private functions and computed properties in their own private extension, omitting the `private` from the function declaration
- Do not write unit tests. At all.