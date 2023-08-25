//
//  File.swift
//  
//
//  Created by Benjamin Böcker on 25.08.23.
//

import Foundation
import UIKit
import SwiftUI


public extension UIFont {
	static let b_largeTitle = UIFont.compressedFont(.extraLargeTitle, weight: .bold)
	static let b_title1 = UIFont.compressedFont(.largeTitle, weight: .bold)
	static let b_title2 = UIFont.compressedFont(.extraLargeTitle2, weight: .bold)
	static let b_title3 = UIFont.compressedFont(.title1, weight: .bold)
	static let b_headline = UIFont.compressedFont(.title2, weight: .semibold)
	static let b_body = UIFont.condensedFont(.title3, weight: .regular)
	static let b_callout = UIFont.condensedFont(.headline, weight: .regular)
	static let b_subheadline = UIFont.condensedFont(.body, weight: .regular)
	static let b_footnote = UIFont.condensedFont(.callout, weight: .regular)
	static let b_caption1 = UIFont.condensedFont(.subheadline, weight: .regular)
	static let b_caption2 = UIFont.condensedFont(.footnote, weight: .regular)
}


public extension Font {
	static let b_largeTitle = Font(UIFont.b_largeTitle)
	static let b_title1 = Font(UIFont.b_title1)
	static let b_title2 = Font(UIFont.b_title2)
	static let b_title3 = Font(UIFont.b_title3)
	static let b_headline = Font(UIFont.b_headline)
	static let b_body = Font(UIFont.b_body)
	static let b_callout = Font(UIFont.b_callout)
	static let b_subheadline = Font(UIFont.b_subheadline)
	static let b_footnote = Font(UIFont.b_footnote)
	static let b_caption1 = Font(UIFont.b_caption1)
	static let b_caption2 = Font(UIFont.b_caption2)
}
