//
//  XPListTest.swift
//  SwiftXP
//
//  Created by Bart Jakobs on 08/01/2022.
//

import SwiftUI



struct XPListRow<Content>: View where Content : View {
	
	var canExpand: Bool = false
	var text: String = "Item"
	var path: String = "Item"
	var icon: XPIcon = .pc
	@Binding var selected: String
	var content: () -> Content
	
	init(canExpand: Bool, text: String = "", path: String = "" ,icon: XPIcon = .pc, selected: Binding<String>, @ViewBuilder _ content: @escaping () -> Content) {
		self.text = text
		self.icon = icon
		self.content = content
		self.canExpand = canExpand
		self.path = path
		self._selected = selected
		
	}
	
	@State var isExpaned: Bool = false
	var isSelected: Bool {
		selected == text
	}
	private func select() {
		selected = text
	}
//	@State var isSelected: Bool = false
	var body: some View {
		HStack(spacing: 6) {
			
			if canExpand {
			
				Button {
					withAnimation {
						isExpaned.toggle()
					}
					
				} label: {
					if isExpaned {
					Image("minus")
					} else {
						Image("plus")
					}
				}
				.buttonStyle(.plain)

			} else {
				Rectangle()
					.frame(width: 9, height: 9)
					.opacity(0.000001)
					.padding([.trailing], 0)
					
			}
			XPIconView(icon: icon, size: .small)
//				.padding([.leading], -3)
		
			Text(text)
				.foregroundColor(isSelected ? .white : .black)
				.xpFont(size: 12)
				
				.background {
					Rectangle()
						.foregroundStyle(Color(red: 0.2, green: 0.4, blue: 0.8))
						.padding(-1)
						.overlay {
							Rectangle()
								.foregroundStyle(Color.white)
								.frame(height: 1)
								.padding([.top], 13)
						}
						.opacity(isSelected ? 1 : 0)
				}
		}
		.contentShape(Rectangle())
		.onTapGesture {
			select()
		}
		.onTapGesture(count: 2) {
			select()
			isExpaned = true
		}
		if (isExpaned) {
			content()
				.padding([.leading], 20)
		}
			
	
	}
}
