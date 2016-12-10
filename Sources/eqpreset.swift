import Foundation
import ScriptingBridge

@objc internal protocol iTunesEQPreset : iTunesItem
{
	// properties as readonly
	@objc optional var band1: Double { get }
	@objc optional var band2: Double { get }
	@objc optional var band3: Double { get }
	@objc optional var band4: Double { get }
	@objc optional var band5: Double { get }
	@objc optional var band6: Double { get }
	@objc optional var band7: Double { get }
	@objc optional var band8: Double { get }
	@objc optional var band9: Double { get }
	@objc optional var band10: Double { get }
	@objc optional var modifiable: Bool { get }
	@objc optional var preamp: Double { get }
	@objc optional var updateTracks: Bool { get }
}

extension SBObject : iTunesEQPreset
{
}

// equalizer preset configuration
public class EQPreset : Item
{
	internal init(_ item: iTunesEQPreset) {
		_item = item
		super.init(item)
	}

	// the equalizer 32 Hz band level (-12.0 dB to +12.0 dB)
	public var band1: Double { get { return _item.band1! } }

	// the equalizer 64 Hz band level (-12.0 dB to +12.0 dB)
	public var band2: Double { get { return _item.band2! } }

	// the equalizer 125 Hz band level (-12.0 dB to +12.0 dB)
	public var band3: Double { get { return _item.band3! } }

	// the equalizer 250 Hz band level (-12.0 dB to +12.0 dB)
	public var band4: Double { get { return _item.band4! } }

	// the equalizer 500 Hz band level (-12.0 dB to +12.0 dB)
	public var band5: Double { get { return _item.band5! } }

	// the equalizer 1 kHz band level (-12.0 dB to +12.0 dB)
	public var band6: Double { get { return _item.band6! } }

	// the equalizer 2 kHz band level (-12.0 dB to +12.0 dB)
	public var band7: Double { get { return _item.band7! } }

	// the equalizer 4 kHz band level (-12.0 dB to +12.0 dB)
	public var band8: Double { get { return _item.band8! } }

	// the equalizer 8 kHz band level (-12.0 dB to +12.0 dB)
	public var band9: Double { get { return _item.band9! } }

	// the equalizer 16 kHz band level (-12.0 dB to +12.0 dB)
	public var band10: Double { get { return _item.band10! } }

	// can this preset be modified?
	public var modifiable: Double { get { return _item.band10! } }

	// the equalizer preamp level (-12.0 dB to +12.0 dB)
	public var preamp: Double { get { return _item.band10! } }

	// should tracks which refer to this preset be updated when the preset is renamed or deleted?
	public var updateTracks: Double { get { return _item.band10! } }

	private var _item: iTunesEQPreset
}
