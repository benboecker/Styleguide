import SwiftUI


@dynamicMemberLookup
public struct Styleguide: Sendable {
	public init(
		fonts: FontStyle,
		colors: ColorStyle,
		spacing: Spacing,
		shadows: Shadows
	) {
		self.fonts = fonts
		self.colors = colors
		self.spacing = spacing
		self.shadows = shadows
	}
	
	internal let fonts: FontStyle
	internal let colors: ColorStyle
	internal let spacing: Spacing
	internal let shadows: Shadows

	public subscript(dynamicMember keypath: KeyPath<Spacing, CGFloat>) -> CGFloat {
		self[keypath]
	}
	
	public subscript(dynamicMember keypath: KeyPath<ColorStyle, DynamicColor>) -> DynamicColor {
		self[keypath]
	}
	
	public subscript(dynamicMember keypath: KeyPath<Shadows, Shadow>) -> Shadow {
		self[keypath]
	}

	public subscript(dynamicMember keypath: KeyPath<FontStyle, Font>) -> Font {
		self[keypath]
	}
}

private extension Styleguide {
	subscript(_ keyPath: KeyPath<FontStyle, Font>) -> Font {
		fonts[keyPath: keyPath]
	}

	subscript(_ keyPath: KeyPath<Spacing, CGFloat>) -> CGFloat {
		spacing[keyPath: keyPath]
	}

	subscript(_ keyPath: KeyPath<ColorStyle, DynamicColor>) -> DynamicColor {
		colors[keyPath: keyPath]
	}
	
	subscript(_ keyPath: KeyPath<Shadows, Shadow>) -> Shadow {
		shadows[keyPath: keyPath]
	}
}


public extension EnvironmentValues {
	@Entry var styleguide: Styleguide = .default
}


#Preview {
	StyleguideShowcaseView()
}



struct StyledPreviewModifier: ViewModifier {
	let styleguide: Styleguide
	
	func body(content: Content) -> some View {
		content
			.environment(\.styleguide, styleguide)
	}
}


public extension View {
	func styledPreview(using styleguide: Styleguide) -> some View {
		self.modifier(StyledPreviewModifier(styleguide: styleguide))
	}
}
