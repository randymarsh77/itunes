import Foundation
import ScriptingBridge

@objc protocol iTunesAudioCDTrack : iTunesTrack
{
	// properties as readonly
	@objc optional var location: NSURL { get }
}

extension SBObject : iTunesAudioCDTrack
{
}

// a track on an audio CD
public class AudioCDTrack : Track
{
	internal init(_ item: iTunesAudioCDTrack) {
		_item = item
		super.init(item)
	}

	// the location of the file represented by this track
	public var location: URL { get { return _item.location! as URL } }

	private var _item: iTunesAudioCDTrack
}
