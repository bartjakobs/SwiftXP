//
//  SmallControl.swift
//  Helper for SwiftXP
//
//  Created by Bart Jakobs on 27/01/2023.
//

import Foundation
import SwiftUI

public struct SmallControl: View{
	public init(type: String, text: String = "", checked: Bool, action: @escaping (() -> ()) ){
		self.type = type
		self.text = text
		self.checked = checked
		self.action = action
	}
	
	var type: String
	var text: String = ""
	
	var checked: Bool
	
	var action: (() -> ())
	@State var isHover: Bool = false
	@State var isDown: Bool = false
	@State var isChecked: Bool = false
	@State private var isFocused = false
	
	static let Size = CGSize(width: 16, height: 16)
	
	private var img: String {
		var str = type
		
		if isChecked {
			str += "-checked"
		} else {
			str += "-unchecked"
		}
		
		if isDown {
			return str + "-active"
		}
		
		if isHover {
			return str + "-hover"
		}
		
		return str
	}
	
	public var body: some View {
		HStack(alignment: .center) {
			
			
			Image(img)
				.resizable()
				.frame(width: SmallControl.Size.width, height: SmallControl.Size.height)
				.onHover(perform: { hover in
					isHover = hover
				})
				.gesture(
					DragGesture(minimumDistance: 0)
						.onChanged({ _ in
							isDown = true
						})
						.onEnded({ gesture in
							isDown = false
							if(CGRect(origin: .zero, size: TopBarButton.Size).contains(gesture.location)) {
								action()
								isChecked.toggle()
							}
						})
				)
		}
		
	}
}
