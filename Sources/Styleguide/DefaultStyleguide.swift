//
//  File.swift
//  SharedComponents
//
//  Created by Benjamin Böcker on 18.10.24.
//

import Foundation
import SwiftUI
import UIKit


// MARK: - DEFINITIONS


/// SPACING
extension CGFloat {
	static let spacingExtraSmall: CGFloat = 4
	static let spacingSmall: CGFloat      = 8
	static let spacingMedium: CGFloat     = 16
	static let spacingLarge: CGFloat      = 24
	static let spacingExtraLarge: CGFloat = 32
}

/// COLORS
enum Colors {
	static let foregroundPrimary   = DynamicColor(light: 0x1A1A1A, dark: 0xFFFFFF)
	static let foregroundSecondary = DynamicColor(light: 0xaaaaaa, dark: 0xaaaaaa)
	static let foregroundTertiary  = DynamicColor(light: 0xffffff, dark: 0xffffff)
	static let backgroundPrimary   = DynamicColor(light: 0xffffff, dark: 0x000003)
	static let backgroundSecondary = DynamicColor(light: 0xEAEAF7, dark: 0x000004)
	static let backgroundTertiary  = DynamicColor(light: 0xffffff, dark: 0x000005)
	static let accentPrimary       = DynamicColor(light: 0x7173D8, dark: 0x40407a)
	static let accentSecondary     = DynamicColor(light: 0xD7C9FF, dark: 0x40407a)
	static let accentTertiary      = DynamicColor(light: 0x451FA9, dark: 0x40407a)
	static let confirmation        = DynamicColor(light: 0x27ae60, dark: 0x27ae60)
	static let warning             = DynamicColor(light: 0xf39c12, dark: 0xf39c12)
	static let error               = DynamicColor(light: 0xc0392b, dark: 0xc0392b)
	static let shadowSmall         = DynamicColor(light: Color.black.opacity(0.15), dark: .clear)
	static let shadowLarge         = DynamicColor(light: Color.black.opacity(0.15), dark: .clear)
}


/// FONTS
enum Fonts {
	static let headline1    = Font.custom("AvenirNext-Bold",     size: 34, relativeTo: .largeTitle)
	static let headline2    = Font.custom("AvenirNext-Bold",     size: 22, relativeTo: .title3)
	static let headline3    = Font.custom("AvenirNext-Bold",     size: 17, relativeTo: .headline)
	static let headline4    = Font.custom("AvenirNext-DemiBold", size: 14, relativeTo: .callout)
	static let body1        = Font.custom("AvenirNext-Medium",   size: 17, relativeTo: .body)
	static let body2        = Font.custom("AvenirNext-Medium",   size: 14, relativeTo: .callout)
	static let caption1     = Font.custom("AvenirNext-Bold",     size: 12, relativeTo: .caption)
	static let caption2     = Font.custom("AvenirNext-Bold",     size: 11, relativeTo: .caption2)
}

/// SHADOWS
enum ShadowSize {
	static let small = Styleguide.Shadow(color: Colors.shadowSmall, radius: 4, offset: 2)
	static let large = Styleguide.Shadow(color: Colors.shadowLarge, radius: 12, offset: 4)
}


// MARK: - EXTENSIONS


extension Styleguide {
	public static let `default`: Styleguide = Styleguide(
		fonts: FontStyle(
			headline1: Fonts.headline1,
			headline2: Fonts.headline2,
			headline3: Fonts.headline3,
			headline4: Fonts.headline4,
			body1: Fonts.body1,
			body2: Fonts.body2,
			caption1: Fonts.caption1,
			caption2: Fonts.caption2
		),
		colors: ColorStyle(
			foregroundPrimary: Colors.foregroundPrimary,
			foregroundSecondary: Colors.foregroundSecondary,
			foregroundTertiary: Colors.foregroundTertiary,
			backgroundPrimary: Colors.backgroundPrimary,
			backgroundSecondary: Colors.backgroundSecondary,
			backgroundTertiary: Colors.backgroundTertiary,
			accentPrimary: Colors.accentPrimary,
			accentSecondary: Colors.accentSecondary,
			accentTertiary: Colors.accentTertiary,
			confirmation: Colors.confirmation,
			warning: Colors.warning,
			error: Colors.error
		),
		spacing: Spacing(
			extraSmall: .spacingExtraSmall,
			small: .spacingSmall,
			medium: .spacingMedium,
			large: .spacingLarge,
			extraLarge: .spacingExtraLarge
		),
		shadows: Styleguide.Shadows(
			small: Styleguide.Shadow(color: ShadowSize.small.color, radius: ShadowSize.small.radius, offset: ShadowSize.small.offset),
			large: Styleguide.Shadow(color: ShadowSize.large.color, radius: ShadowSize.large.radius, offset: ShadowSize.large.offset)
		)
	)
}
