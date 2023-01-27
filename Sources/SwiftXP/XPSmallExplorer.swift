//
//  XPSmallExplorer.swift
//  SwiftXP
//
//  Created by Bart Jakobs on 08/01/2022.
//

import SwiftUI

public struct XPSmallExplorer: View {
	@ObservedObject var vm: ExplorerViewModel = ExplorerViewModel()
//	@Binding var selectedFile: String
//
//	public init(selectedFile: Binding<String>){
//		self._selectedFile = selectedFile
//	}
//
	public init(){}
	public var body: some View {
		
		ScrollView(axes: .vertical, showsIndicators: false, offsetChanged: { point in
			
		})
		{
			
			VStack(alignment: .leading, spacing: 2) {
				XPListRow(canExpand: true, text: "My Computer", path: "Computer", icon: .pc, selected: $vm.selected)
				{
					ForEach(vm.entries) { entry in
						XPSmallExplorerEntry(entry: entry)
					}
					.environmentObject(vm)
				}
			}
//			.onChange(of: vm.selected) { newValue in
//				selectedFile = newValue
//			}
		}
		//		}
	}
}

public struct XPSmallExplorerEntry: View{
	@ObservedObject var entry: ExplorerEntry
	@EnvironmentObject var vm: ExplorerViewModel
	
	public init(entry: ExplorerEntry) {
		self.entry = entry
	}
	
	public var body: some View {
		XPListRow(canExpand: entry.isDirectory, text: entry.name, path: entry.path, icon: entry.icon, selected: $vm.selected)
		{
			
			ForEach(entry.entries) { subEntry in
				XPSmallExplorerEntry(entry: subEntry)
			}
		}
		.onAppear {
			
			entry.read()
		}
	}
}

public class ExplorerViewModel: ObservableObject {
	@Published var entries: [ExplorerEntry] = []
	@Published var selected: String = ""
	init(){
		// Get the document directory url
		
		var url =  URL(string: "/")!
		entries.append(ExplorerEntry(name: "C:\\", path: url, icon: .hardDisk))
		
		url =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		entries.append(ExplorerEntry(name: "My Documents", path: url, icon: .folderDocument))
		
		url =  FileManager.default.urls(for: .musicDirectory, in: .userDomainMask).first!
		entries.append(ExplorerEntry(name: "My Music", path: url, icon: .folderMusic))
		
		url =  FileManager.default.urls(for: .moviesDirectory, in: .userDomainMask).first!
		entries.append(ExplorerEntry(name: "My Movies", path: url, icon: .folderMovie))
		
	}
	
}

public class ExplorerEntry: ObservableObject, Identifiable {
	public var id: String {
		return path
	}
	var name: String
	var path: String
	var icon: XPIcon
	var url: URL
	
	@Published var entries: [ExplorerEntry] = []
	var hasRead = false
	var isDirectory = false
	
	init(path: URL){
		if path.hasDirectoryPath {
			self.icon = .folder
			self.isDirectory = true
		} else {
			self.icon = .document
		}
		self.path = path.absoluteString
		self.name = path.lastPathComponent
		self.url = path
	}
	
	func read(){
		print("Read \(self.url)")
		guard !hasRead else {return}
		guard isDirectory else {return}
		
		guard self.url.startAccessingSecurityScopedResource() else { print("tja");return }
		
		guard let directoryContents = try? FileManager.default.contentsOfDirectory(at: self.url, includingPropertiesForKeys: [.isDirectoryKey]) else { print("pech"); return }
		print(directoryContents)
		
		for file in directoryContents {
			self.entries.append(
				ExplorerEntry(path: file))
			print(" - \(file) ")
			
			
		}
		
		hasRead = true
	}
	
	public convenience init(name: String, path: URL, icon: XPIcon? = nil) {
		self.init(path: path)
		self.name = name
		if let icon = icon {
			self.icon = icon
		}
	}
}




public struct ScrollView<Content: View>: View {
	let axes: Axis.Set
	let showsIndicators: Bool
	let offsetChanged: (CGPoint) -> Void
	let content: Content
	
	public init(
		axes: Axis.Set = .vertical,
		showsIndicators: Bool = true,
		offsetChanged: @escaping (CGPoint) -> Void = { _ in },
		@ViewBuilder content: () -> Content
	) {
		self.axes = axes
		self.showsIndicators = showsIndicators
		self.offsetChanged = offsetChanged
		self.content = content()
	}
	
	public var body: some View {
		HStack {
			SwiftUI.ScrollView(axes, showsIndicators: showsIndicators) {
				GeometryReader { geometry in
					Color.clear.preference(
						key: ScrollOffsetPreferenceKey.self,
						value: geometry.frame(in: .named("scrollView")).origin
					)
				}.frame(width: 0, height: 0)
				content
			}
			.coordinateSpace(name: "scrollView")
			.onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: offsetChanged)
			
			
		}
	}
}


public struct ScrollOffsetPreferenceKey: PreferenceKey {
	public static var defaultValue: CGPoint = .zero
	
	public static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}


