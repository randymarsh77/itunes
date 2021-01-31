import Foundation
import ScriptingBridge

typealias iTunesEAPD = String

@objc internal protocol iTunesAirPlayDevice : iTunesItem
{
	// properties as readonly
	@objc optional var active: Bool { get }
	@objc optional var available: Bool { get }
	@objc optional var kind: iTunesEAPD { get }
	@objc optional var networkAddress: String { get }
	@objc optional var protected: Bool { get }
	@objc optional var selected: Bool { get }
	@objc optional var supportsAudio: Bool { get }
	@objc optional var supportsVideo: Bool { get }
	@objc optional var soundVolume: NSInteger { get }

	// setters for settable properties
	@objc optional func setSelected(_ selected: Bool)
	@objc optional func setSoundVolume(_ volume: NSInteger)
}

extension SBObject : iTunesAirPlayDevice
{
}

public enum AirPlayDeviceKind : String
{
	case Computer = "kAPC"
	case AirPortExpress = "kAPX"
	case AppleTV = "kAPT"
	case AirPlayDevice = "kAPO"
	case Unknown = "kAPU"
}

// an AirPlay device
public class AirPlayDevice : Item
{
	internal init(_ item: iTunesAirPlayDevice) {
		_item = item
		super.init(item)
	}

	// is the device currently being played to?
	public var active: Bool { get { return _item.active! } }

	// is the device currently available?
	public var available: Bool { get { return _item.available! } }

	// the kind of the device
	public var kind: AirPlayDeviceKind { get { return AirPlayDeviceKind(rawValue: _item.kind!)! } }

	// the network (MAC) address of the device
	public var networkAddress: String { get { return _item.networkAddress! } }

	// is the device password- or passcode-protected?
	public var protected: Bool { get { return _item.protected! } }

	// is the device currently selected?
	public var selected: Bool {
		get { return _item.selected! }
		set(value) { _item.setSelected!(value) }
	}

	// does the device support audio playback?
	public var supportsAudio: Bool { get { return _item.supportsAudio! } }

	// does the device support video playback?
	public var supportsVideo: Bool { get { return _item.supportsVideo! } }

	// the output volume for the device (0 = minimum, 100 = maximum)
	public var soundVolume: Int {
		get { return _item.soundVolume! }
		set(value) { _item.setSoundVolume!(value) }
	}

	private var _item: iTunesAirPlayDevice
}
