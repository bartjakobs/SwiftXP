//
//  XPWIndow.swift
//  SwiftXP
//
//  Created by Bart Jakobs on 08/01/2022.
//

import SwiftUI

public struct XPWindow<Content>: View where Content : View  {
	var title: String
	var xpIcon: XPIcon
	
	var content: () -> Content

	
	public init(title: String = "",  xpIcon: XPIcon = .document, @ViewBuilder _ content: @escaping () -> Content) {
		self.title = title
		self.xpIcon = xpIcon
		self.content = content
	}
	
	public var body: some View {
			
			VStack(spacing: 0) {
				XPTitleBar(title: title, xpIcon: xpIcon)
					
				
				HStack(spacing: 0) {
					Image("window-left")
						.resizable()
						.frame(width: 4)
					Spacer()
					content()
						.padding(4)
					Spacer()
					Image("window-right")
						.resizable()
						.frame(width: 4)
				}
				
				.background(Color(nsColor:  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ))
				HStack(spacing: 0) {
					Image("window-bottom-left")
						
						.frame(width: 4, height: 4)
					
					Image("window-bottom")
						.resizable()
						.frame(height: 4)
					
					Image("window-bottom-right")
						
						.frame(width: 4, height: 4)
				}
					
				
			}
        
    }
}


struct XPWIndow_Previews: PreviewProvider {
    static var previews: some View {
		XPWindow {
			Text("Oh?")
				.padding()
		}
    }
}
