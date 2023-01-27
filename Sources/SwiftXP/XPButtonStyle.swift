//
//  XPButtonStyle.swift
//  SwiftXP
//
//  Created by Bart Jakobs on 07/01/2022.
//

import Foundation
import SwiftUI

public struct XPButtonStye: ButtonStyle {
	@State private var isFocused = false
	@State var isHover: Bool = false
	@State var isDown: Bool = false
		
	public init(){}
	
	private var img: String {
		if isDown {
			return "button-focused-pressed"
		}
		if isFocused {
			return "button-focused"
		}
		if isHover {
			return "button-hover"
		}
		return "button"
	}
	
	public func makeBody(configuration: Configuration) -> some View {
		ZStack {
			HStack(spacing: 0) {
				Rectangle().fill(ImagePaint(image: Image(img), sourceRect: CGRect(x: 0, y:0, width: 0.4, height: 1)))
					.frame(width: 4, height: 23)
				
				Rectangle().fill(ImagePaint(image: Image(img), sourceRect: CGRect(x: 0.4, y:0, width: 0.2, height: 1)))
					.frame(minWidth: 4, maxHeight: 23)
				
				
				Rectangle().fill(ImagePaint(image: Image(img), sourceRect: CGRect(x: 0.6, y:0, width: 0.4, height: 1)))
					.frame(width: 4, height: 23)
					.frame(width: 4, height: 23)
			}
			configuration.label
				.font(.custom("Tahoma", size: 12))
				.foregroundColor(.black)
		}
		.onHover { hover in
			isHover = hover
		}
		.gesture(
			DragGesture(minimumDistance: 0)
				.onChanged({ _ in
					
					isDown = true
				})
				.onEnded({ gesture in
					isDown = false
				})
		)
	}	
}

