//
//  XPTitlebar.swift
//  SwiftXP
//
//  Created by Bart Jakobs on 08/01/2022.
//

import SwiftUI


struct XPTitleBar: View {
	
	var title: String
	
	var icon: Image?
	var xpIcon: XPIconView?
	
	init(title: String) {
		self.title = title
	}
	
	init(title: String, icon: Image) {
		self.title = title
		self.icon = icon
	}
	
	init(title: String, xpIcon: XPIcon) {
		self.title = title
		self.xpIcon = XPIconView(icon: xpIcon, size: .small)
	}
	
	var body: some View {
		HStack(spacing: 0) {
			Image("window-top-left")
				
			ZStack {
				Image("window-top")
					.resizable()
//					.dragWndWithClick()
				HStack(spacing: 0) {
					if icon != nil {
						icon!
							.padding([.leading, ], 3)
							.padding([.top], 1)
					}
					if xpIcon != nil {
						xpIcon!
							.padding([.leading, ], 3)
							.padding([.top], 1)
					}
					Text(title)
						.font(.custom("Tahoma", size: 12))
						.foregroundColor(.white)
						.shadow(color: .black, radius: 0, x: 1, y: 1)
						.padding([.leading], 4)
					Spacer()
					
					TopBarButton(name: "minimize"){
						print("Minimize")
					}
					.padding([.trailing], 4)
					TopBarButton(name: "maximize"){
						print("Maxxx")
					}
					.padding([.trailing], 4)
					TopBarButton(name: "close"){
						print("Close")
					}
					
				}.padding([.trailing], 4)
				
			}
			Image("window-top-right")
		
		}
		.frame(height: 30)
	}
}



struct TopBarButton: View {
	var name: String = "close"
	var action: (() -> ())
	@State var isHover: Bool = false
	@State var isDown: Bool = false
	static let Size = CGSize(width: 21, height: 21)
	
	var body: some View {
		
		
		Image(isDown ? "\(name)-active" : (isHover ? "\(name)-hover" : "\(name)-normal") )
			.resizable()
			.frame(width: TopBarButton.Size.width, height: TopBarButton.Size.height)
		
			.onHover { hover in
				isHover = hover
			}
			.highPriorityGesture(
				DragGesture(minimumDistance: 0)
					.onChanged({ _ in
						print("hu")
						isDown = true
					})
					.onEnded({ gesture in
						isDown = false
						if(CGRect(origin: .zero, size: TopBarButton.Size).contains(gesture.location)) {
							action()
						}
					})
			)
		
		
	}
}

struct XPTitlebar_Previews: PreviewProvider {
    static var previews: some View {
		
		XPTitleBar(title: "Test titel!", xpIcon: .document)
			.previewLayout(.fixed(width: 500, height: 40))
		
		
    }
}
