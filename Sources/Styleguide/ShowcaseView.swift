//
//  SwiftUIView.swift
//  
//
//  Created by Benjamin Böcker on 20.04.24.
//

import SwiftUI


public struct StyleguideShowcaseView: View {
	public init() { }
	
	@Environment(\.styleguide) private var styleguide
	
	public var body: some View {
		Text("")
		//		TabView {
		//			Tab {
		//				Colors()
		//			} label: {
		//				Label("Colors", systemImage: "paintpalette")
		//			}
		//			
		//			Tab {
		//				Fonts()
		//			} label: {
		//				Label("Fonts", systemImage: "textformat.size")
		//			}
		//			
		//			Tab {
		//				Spacings()
		//			} label: {
		//				Label("Spacings", systemImage: "arrow.left.and.line.vertical.and.arrow.right")
		//			}
		//
		//		}
	}
}
//	func Colors() -> some View {
//		ScrollView {
//			VStack {
//				ContentSection("Foreground") {
//					HStack {
//						ColorPreview("Primary", color: styleguide.foregroundPrimary)
//						ColorPreview("Secondary", color: styleguide.foregroundSecondary)
//						ColorPreview("Tertiary", color: styleguide.foregroundTertiary)
//					}
//				}
//
//				ContentSection("Background") {
//					HStack {
//						ColorPreview("Primary", color: styleguide.backgroundPrimary)
//						ColorPreview("Secondary", color: styleguide.backgroundSecondary)
//						ColorPreview("Tertiary", color: styleguide.backgroundTertiary)
//					}
//				}
//				
//				ContentSection("Accent") {
//					HStack {
//						ColorPreview("Primary", color: styleguide.accentPrimary)
//						ColorPreview("Secondary", color: styleguide.accentSecondary)
//						ColorPreview("Tertiary", color: styleguide.accentTertiary)
//					}
//				}
//
//				ContentSection("Extra") {
//					HStack {
//						ColorPreview("Confirmation", color: styleguide.confirmation)
//						ColorPreview("Warning", color: styleguide.warning)
//						ColorPreview("Error", color: styleguide.error)
//					}
//				}
//			}
//			.padding()
//		}
//	}
//	
//	func Fonts() -> some View {
//		ScrollView {
//			VStack(alignment: .leading, spacing: styleguide.extraLarge) {
//				FontPreview("largeTitle", font: styleguide.largeTitle)
//				FontPreview("title", font: styleguide.title)
//				FontPreview("headline", font: styleguide.headline)
//				FontPreview("body", font: styleguide.body)
//				FontPreview("caption", font: styleguide.caption)
//			}
//			.frame(maxWidth: .infinity, alignment: .leading)
//			.padding()
//		}
//	}
//	
//	func Spacings() -> some View {
//		ScrollView {
//			VStack(alignment: .leading) {
//				ContentSection("Spacings") {
//					SpacingPreview("extraSmall", value: styleguide.extraSmall, showValue: false)
//					SpacingPreview("small", value: styleguide.small, showValue: false)
//					SpacingPreview("medium", value: styleguide.medium, showValue: false)
//					SpacingPreview("large", value: styleguide.large, showValue: true)
//					SpacingPreview("extraLarge", value: styleguide.extraLarge, showValue: true)
//				}
//			}
//			.padding()
//		}
//	}
//	
//	func FontPreview(_ name: String, font: Font) -> some View {
//		VStack(alignment: .leading, spacing: styleguide.medium) {
//			Text(name)
//				.font(.system(.headline, weight: .bold))
//				.foregroundStyle(.secondary)
//			Text("This is a quick FontStyle test")
//				.font(font)
//			
//		}
//	}
//
//	func ColorPreview(_ name: String, color: Color) -> some View {
//		VStack(alignment: .leading, spacing: styleguide.medium) {
//			Color.clear
//				.background(color)
//				.clipShape(.rect(cornerRadius: 8))
//				.aspectRatio(1.5, contentMode: .fill)
//				.shadow(color: .black.opacity(0.2), radius: 2, y: 2)
//			
//			VStack(alignment: .leading, spacing: styleguide.extraSmall) {
//				Text(name)
//					.font(.system(.headline, weight: .bold))
//					.foregroundStyle(.primary)
//				
//				if let hex = color.toHex() {
//					Text("#\(hex)")
//						.font(.system(.headline, weight: .bold))
//						.foregroundStyle(.secondary)
//				}
//			}
//		}
//	}
//	
//	func SpacingPreview(_ name: String, value: CGFloat, showValue: Bool) -> some View {
//		HStack {
//			Text(name)
//			
//			DistanceView(value: showValue ? value : nil)
//				.frame(width: value, height: 20, alignment: .leading)
//		}
//	}
//		
//	func ContentSection<Content: View>(_ title: String, @ViewBuilder contents: () -> Content) -> some View {
//		Section {
//			contents()
//		} header: {
//			Text(title)
//				.font(.system(.title2, design: .rounded, weight: .bold))
//				.frame(maxWidth: .infinity, alignment: .leading)
//				.padding(.bottom, 16)
//		} footer: {
//			Color.clear
//				.frame(height: 42)
//		}
//	}
//}
//
//
//struct DistanceView: View {
//	init(value: CGFloat? = nil) {
//		self.value = value
//	}
//	
//	let value: CGFloat?
//	
//	var body: some View {
//		Canvas(
//			opaque: false,
//			colorMode: .linear,
//			rendersAsynchronously: false
//		) { context, size in
//			
//			let resolved = context.resolve(
//				Text(value ?? 0, format: .number.precision(.fractionLength(0)))
//					.font(.caption2.bold())
//					.foregroundStyle(Color.white)
//			)
//			let textSize = resolved.measure(in: size)
//			
//			let textRect = CGRect(
//				origin: CGPoint(
//					x: size.width / 2 - textSize.width / 2,
//					y: size.height / 2 - textSize.height / 2
//				),
//				size: textSize
//			)
//			
//			let textBackgroundRect = textRect.insetBy(dx: -4, dy: -2)
//			let textBackgroundPath = Path(roundedRect: textBackgroundRect, cornerRadius: 4)
//			
//			let rect = CGRect(origin: .zero, size: size)
//			
//			let middlePath = Path { path in
//				path.move(to: CGPoint(x: rect.minX, y: rect.midY))
//				path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
//			}
//			
//			let leftPath = Path { path in
//				path.move(to: CGPoint(x: rect.minX + 1, y: textBackgroundRect.minY))
//				path.addLine(to: CGPoint(x: rect.minX + 1, y: textBackgroundRect.maxY))
//			}
//			
//			let rightPath = Path { path in
//				path.move(to: CGPoint(x: rect.maxX - 1, y: textBackgroundRect.minY))
//				path.addLine(to: CGPoint(x: rect.maxX - 1, y: textBackgroundRect.maxY))
//			}
//
//			context.stroke(middlePath, with: .color(.accentColor), lineWidth: 2)
//			context.stroke(leftPath, with: .color(.accentColor), lineWidth: 2)
//			context.stroke(rightPath, with: .color(.accentColor), lineWidth: 2)
//			
//			if value != nil {
//				context.fill(textBackgroundPath, with: .color(.accentColor))
//				context.draw(resolved, in: textRect)
//			}
//		}
//	}
//}
//
//
//
//
//#Preview {
//	StyleguideShowcaseView()
//}
//
//
//#Preview("DistanceView") {
//	DistanceView(value: 200)
//		.frame(width: 200, height: 50)
//		.border(.gray.opacity(0.3), width: 1)
//}
//
//
//private extension Color {
//	func toHex() -> String? {
//		let uic = UIColor(self)
//		guard let components = uic.cgColor.components, components.count >= 3 else {
//			return nil
//		}
//		let r = Float(components[0])
//		let g = Float(components[1])
//		let b = Float(components[2])
//		var a = Float(1.0)
//		
//		if components.count >= 4 {
//			a = Float(components[3])
//		}
//		
//		if a != Float(1.0) {
//			return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
//		} else {
//			return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
//		}
//	}
//}
