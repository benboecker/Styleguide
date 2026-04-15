# Multi-Phase Styleguide Improvement Plan

This plan will reshape our package around two promises: a maintainable way to define an app’s semantic styles, and an easy way to use those styles in SwiftUI and UIKit code. We will fix correctness first, then strengthen token definition, then streamline usage APIs, and finally restore our documentation and showcase story around the finished public surface.

## Phase 1: Correctness And `DynamicColor` Foundation
- [ ] Rework `DynamicColor` into a trustworthy dual-appearance token.
	- [ ] Keep both light and dark variants as first-class stored values so the type always models an appearance-aware color.
	- [ ] Keep single-value convenience initializers only as shorthand for “same color in both appearances.”
	- [ ] Preserve `DynamicColor: ShapeStyle` so the token continues to work directly in SwiftUI APIs that expect shape styles.
	- [ ] Keep `resolve(in:)` as the SwiftUI appearance-resolution path and ensure all SwiftUI rendering flows through it.
- [ ] Remove misleading convenience APIs that hide appearance behavior.
	- [ ] Remove, rename, or redesign helpers such as `color` and `gradient` if they can return only the light variant or otherwise bypass appearance-aware resolution.
	- [ ] Replace ambiguous helpers with explicit APIs whose names make the resolution strategy obvious.
	- [ ] Remove unused environment storage and dead comments from the implementation so the type has one clear resolution model.
- [ ] Define the UIKit alternative from the same semantic token.
	- [ ] Add a UIKit conversion path that returns a dynamic `UIColor` equivalent of the token rather than introducing a second UIKit-specific color-token type.
	- [ ] Support both “dynamic UIKit color” usage and explicit trait-based resolution where UIKit call sites need a concrete value.
	- [ ] Keep `DynamicColor` as the source of truth for both SwiftUI and UIKit color usage.
- [ ] Verify the corrected behavior before expanding the rest of the package.
	- [ ] Build the package after the `DynamicColor` refactor.
	- [ ] Manually verify light and dark appearance switching in SwiftUI styling APIs such as foregrounds, fills, strokes, and backgrounds.
	- [ ] Manually verify the UIKit conversion path produces correct appearance behavior.
	- [ ] Confirm no public API silently collapses to the wrong appearance.

## Phase 2: Maintainable Style Definition
- [ ] Keep `Styleguide` as the one semantic container for our style tokens.
	- [ ] Preserve grouped token ownership for colors, fonts, spacing, and shadows so the package remains organized and extensible.
	- [ ] Treat those groups as the authoring model even if app code uses shorthand access through dynamic members.
- [ ] Make style definition easier to maintain over time.
	- [ ] Keep color names semantic and role-based instead of tied to raw values.
	- [ ] Rework font definition so one semantic font token can support both SwiftUI and UIKit usage without app-specific bridge code.
	- [ ] Normalize spacing and shadow scales so the defaults and the bundled preset form one coherent system.
	- [ ] Resolve the current mismatch between `Spacing` initializer defaults and the default preset values.
- [ ] Rework the shipped preset into a reusable package baseline.
	- [ ] Replace app-branded defaults such as the current `AvenirNext` typography and hard-coded product palette unless we explicitly want a branded sample preset.
	- [ ] If we keep a branded preset, rename it so it reads as a sample or preset theme instead of the universal default.
	- [ ] Keep the bundled preset visually coherent in both appearances and suitable as a safe starting point for consumers.
- [ ] Simplify preset construction.
	- [ ] Remove helper layers that exist only to build one preset constant unless they become reusable preset-building utilities.
	- [ ] Keep token-definition code direct enough that consumers can copy the pattern to build their own styleguides.

## Phase 3: Easy Style Usage In App Code
- [ ] Optimize the public API for ergonomic usage in app code.
	- [ ] Keep `@dynamicMemberLookup` as the preferred consumption path so our styling reads tersely in views and UI code.
	- [ ] Ensure the shorthand does not create confusing collisions between token groups as the package grows.
	- [ ] Keep the grouped token model available as the structural backing for clarity and future extensibility.
- [ ] Keep SwiftUI consumption simple and idiomatic.
	- [ ] Preserve `EnvironmentValues.styleguide` as the main entry point in SwiftUI.
	- [ ] Keep `@Environment(\.styleguide)` as the primary app-facing access pattern.
	- [ ] Ensure `DynamicColor`, fonts, spacing, and shadows can all be applied directly or with minimal wrapper code in SwiftUI.
- [ ] Add UIKit usage APIs from the same styleguide model.
	- [ ] Add explicit conversion paths from semantic color tokens to `UIColor`.
	- [ ] Add explicit conversion paths from semantic font tokens to `UIFont`.
	- [ ] Add a UIKit-friendly shadow representation or helper that applies shadow tokens to a `CALayer` without repeated app-level mapping logic.
	- [ ] Keep these as platform conversions from the same styleguide model rather than parallel UIKit token groups.
- [ ] Make “easy to use” concrete in our public API and documentation.
	- [ ] A SwiftUI consumer should only need environment access plus direct token application.
	- [ ] A UIKit consumer should only need styleguide access plus explicit conversion calls, not custom bridge utilities in the app target.
	- [ ] The package should reduce raw color, font, and spacing literals in app code.

## Phase 4: Documentation, Showcase, And Source Hygiene
- [ ] Rebuild our showcase around the real public API.
	- [ ] Replace the current placeholder `StyleguideShowcaseView` with a maintained showcase that demonstrates token definition and token usage.
	- [ ] Ensure the showcase reflects the final token names and real usage paths rather than old experiments.
	- [ ] Verify the showcase in light and dark appearance so it also acts as manual design validation.
- [ ] Document the package around the two promised outcomes.
	- [ ] Add or update documentation in `documentation/` that explains how to define a custom styleguide.
	- [ ] Document how SwiftUI code consumes the styleguide through the environment.
	- [ ] Document how UIKit code consumes the same tokens through explicit platform conversions.
	- [ ] Add documentation comments for all public types, properties, and functions touched by the refactor.
- [ ] Clean up the source layout so the package can grow cleanly.
	- [ ] Remove large commented-out blocks and dead code from shipping sources.
	- [ ] Keep preview and showcase helpers from bloating the core API files.
	- [ ] Move toward one primary type per file where practical and safe under our current structure.
	- [ ] Keep imports and file ownership aligned with the repo conventions.

## Cross-Cutting Constraints
- [ ] Keep the package focused on style definition and style consumption, not reusable app components.
	- [ ] The package should help define semantic colors, fonts, spacing, and shadows.
	- [ ] The package should help use those tokens ergonomically in code.
	- [ ] The package should not grow into a view-component library in this milestone.
- [ ] Prefer one semantic source of truth with platform-specific edges.
	- [ ] SwiftUI support stays native through `ShapeStyle`, `Font`, environment access, and direct token application.
	- [ ] UIKit support is delivered through explicit conversions from the same tokens.
	- [ ] Correctness takes priority over preserving misleading convenience APIs.
- [ ] Follow repository constraints during implementation.
	- [ ] Use `BuildProject` for build validation.
	- [ ] Do not add unit tests.
	- [ ] Document code changes in `documentation/changelog.md` once implementation work starts.
	- [ ] Document all new public types, properties, and functions in code.

## Completion Criteria
- [ ] The package builds cleanly in Xcode after each phase.
- [ ] `DynamicColor` supports both light and dark appearances, remains a `ShapeStyle`, and has a clear UIKit conversion path.
- [ ] A consumer can define a custom styleguide without scattering raw values or ad hoc helpers across the app.
- [ ] A SwiftUI consumer can use the styleguide ergonomically through environment access and dynamic-member-based tokens.
- [ ] A UIKit consumer can use the same semantic tokens through explicit platform conversions without app-specific bridge code.
- [ ] The bundled preset, showcase, and documentation all match the actual public API.
