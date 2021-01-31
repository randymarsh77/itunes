import Foundation
import ScriptingBridge

@objc protocol iTunesFileTrack : iTunesTrack
{
	// properties as readonly
	@objc optional var location: NSURL { get }

	// methods
	@objc optional func refresh()
}

extension SBObject : iTunesFileTrack
{
}

// a track representing an audio file (MP3, AIFF, etc.)
public class FileTrack : Track
{
	internal init(_ item: iTunesFileTrack) {
		_item = item
		super.init(item)
	}

	// the location of the file represented by this track
	public var location: URL { get { return _item.location! as URL } }

	// update file track information from the current information in the track’s file
	public func refresh() {
		_item.refresh!()
	}

	private var _item: iTunesFileTrack
}
