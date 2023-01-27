//
//  XPIcon.swift
//  segmenttest
//
//  Created by Bart Jakobs on 08/01/2022.
//

import SwiftUI

public enum XPIcon: Int, Identifiable {
	public var id: Int {
		return self.rawValue
	}
	
	static let count = 171
	public static var all: [XPIcon] {
		var icons = [XPIcon]()
		(0..<count).forEach { i in
			if let icon = XPIcon(rawValue: i) {
				icons.append(icon)
			}
		}
		return icons
		
	}
	public var rectInSpritesheet: CGRect {
		//(1/18 * 3).
		
		let x: Int = self.rawValue % 18
		let y: Int = self.rawValue / 18
		
		return CGRect(x: Double(x) / 18, y: Double(y) / 19, width: 1/18, height: 1/19)
	}
	
	case pc
	case trash
	case trashFull
	case circleGraph
	case power
	case gear
	case volumeSlider
	case lockSide
	case lockFront
	case keys
	case software
	case timezone
	case star
	case archive
	case coloredBlocks
	case letter
	case magnifier
	case notepad
	case paint
	case calculator
	case briefcase
	case keyboard
	case mouse
	case pointer
	case agenda
	case book
	case outlook
	case network
	case networkInternet
	case networkModem
	case pcSattelite
	case pcTelephone
	case pcPallette
	case pcPaintbrush
	case pcCircledI
	case pcKeyboardFlat
	
	case pcKeyboard
	case pcDevice
	case pcCheckmark
	case folder
	case folderOpen
	case folderStar
	case folderHand
	case folderLetterA
	case folderCheckmark
	case folderMagnifier
	case folderMusic
	case folderPicture
	case folderDocument
	case folderMusic2
	case folderVideoCamera
	case folderSpeaker
	case folderPicture2
	case folderClock
	
	case folderPointer
	case folderMovie
	case folderScreensaver
	case folderInternet
	case folderImage
	case folderFile
	case folderGreenFile
	case folderBlueFile
	case folderTimemachie
	case folderDocumentNetwork
	case folderStarConected
	case document
	case documentPictureSunset
	case documentPictureForest
	case documentShapes
	case documentPaintbrush
	case documentLetterA
	case documentLettera
	case documentLetterO
	case documentLetterTT
	case documentLetterTT2
	case documentMusic
	case documentMovie
	case documentMedia
	case speaker
	case speakerMuted
	case musicSpeaker
	case musicNotes
	case CD
	case CDImage
	case CDR
	case CDROM
	case CDRW
	case DVD
	case DVDROM
	case DVDRAM
	case DVDR
	case DVDRW
	case CDMusic
	case CDQuestionMark
	case CDMusicPlus
	case CDWindow
	case CDReader
	case DVDReader
	case earth
	case earthLine
	case earthArrows
	case earthConnection
	case globe
	case earthMusic
	case earthMouse
	case earthStar
	case earthMouseStar
	case earthArrowUp
	case earthWindows
	case earthTriangleExclamation
	case earthMagnifier
	case earthTelephone
	case earthWall
	case earthPCs
	case earthPCCheckmark
	case earthPC
	case earthPCLaptop
	case earthRedLine
	case infoSpeechBubble
	case questionSpeechBubble
	case warning
	case forbidden
	case error
	case redX
	case powerButton
	case keyButton
	case smallKeyButton
	case smallEjectButton
	case smallPowerButton
	case questionCircle
	case smallQuestionCircle
	case windowExclamation
	case windowForbidden
	case windowGreenCheckmark
	case windowGreenCheckmarkSmall
	case windowRedForbidden
	case disk
	case hardDisk
	case bigDisk
	case biggerDisk
	case server
	case servers
	case serverCheckmark
	case deviceArrow
	
	case PCsOff = 162
	case PCsBackOff
	case PCsOn
	case connectedHouse
	case IExplorer
	case IExplorerDocument
	case IExplorerDocumentError
	case gameSpades
	case gameBall
	case gameHeart
	
	}
