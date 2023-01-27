//
//  XPFont.swift
//  SwiftXP
//
//  Created by Bart Jakobs on 08/01/2022.
//

import SwiftUI


public struct XPFont: ViewModifier {
	var size: CGFloat = 12
	
	public func body(content: Content) -> some View {
		return content
			.font(.custom("Tahoma", size: size))
			.foregroundColor(.black)
	}
	
}

public extension View {
	func xpFont(size: CGFloat = 12) -> some View {
		return self.modifier(XPFont(size: size))
	}
}
