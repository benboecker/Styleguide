import SwiftUI

struct StyledPreviewModifier: ViewModifier {
	let styleguide: Styleguide

	func body(content: Content) -> some View {
		content
			.environment(\.styleguide, styleguide)
	}
}

extension View {
	/// Injects a styleguide into the view hierarchy for previewing.
	func styledPreview(using styleguide: Styleguide) -> some View {
		modifier(StyledPreviewModifier(styleguide: styleguide))
	}
}
