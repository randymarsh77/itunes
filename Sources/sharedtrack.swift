import Foundation
import ScriptingBridge

@objc protocol iTunesSharedTrack: iTunesTrack
{
}

extension SBObject : iTunesSharedTrack
{
}

// a track residing in a shared library
public class SharedTrack : Track
{
	internal init(_ item: iTunesSharedTrack) {
		_item = item
		super.init(item)
	}

	private var _item: iTunesSharedTrack
}
