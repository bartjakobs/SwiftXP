//
//  XPPickerStyle.swift
//  SwiftXP
//
//  Created by Bart Jakobs on 07/01/2022.
//

import Foundation

import Combine
import SwiftUI

public struct XPToggleStyle: ToggleStyle {
	public init(){}
	public func makeBody(configuration: Configuration) -> some View {
		HStack {
		SmallControl(type: "checkbox", checked: configuration.isOn) {
			configuration.isOn.toggle()
		}
		configuration.label
			.foregroundColor(.black)
			.onTapGesture {
				configuration.isOn.toggle()
			}
		}
	}
}
