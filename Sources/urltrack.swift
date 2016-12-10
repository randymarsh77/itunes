import Foundation
import ScriptingBridge

@objc protocol iTunesURLTrack : iTunesTrack
{
	// properties as readonly
	@objc optional var address: NSString { get }

	// setters for settable properties
	@objc optional func setAddress(_ value: NSString)
}

extension SBObject : iTunesURLTrack
{
}

// a track representing a network stream
public class UrlTrack : Track
{
	internal init(_ item: iTunesURLTrack) {
		_item = item
		super.init(item)
	}

	// the URL for this track
	public var address: String {
		get { return _item.address! as String }
		set(value) { _item.setAddress!(value as NSString) }
	}

	private var _item: iTunesURLTrack
}
