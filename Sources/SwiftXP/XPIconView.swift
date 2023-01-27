//
//  XPIcon.swift
//  SwiftXP
//
//  Created by Bart Jakobs on 08/01/2022.
//

import SwiftUI

public struct XPIconView: View {
	var icon: XPIcon
	var size: XPIconSize = .large
	
    public var body: some View {
		Rectangle()
			.foregroundStyle(.image(Image("icons"), sourceRect: icon.rectInSpritesheet, scale: size.scale))
				
				.frame(width: size.size, height: size.size)
		
    }

	public enum XPIconSize {
		case small
		case large
		
		var size: CGFloat? {

			return self == .large ? 32 : 16
		}
		var scale: CGFloat {
			return self == .large ? 1 : 0.5
		}
	}
	
	
	
}

struct XPIcon_Previews: PreviewProvider {
    static var previews: some View {
		if #available(macOS 13.0, *) {
			Grid {
				ForEach(XPIcon.all) { icon in
					XPIconView(icon: icon, size: .large)
						.previewLayout(.fixed(width: 100, height: 102.0))
				}
			}
		} else {
			HStack{
				ForEach(XPIcon.all) { icon in
					XPIconView(icon: icon, size: .large)
						.previewLayout(.fixed(width: 100, height: 102.0))
				}
			}
		}

		
		
    }
}
