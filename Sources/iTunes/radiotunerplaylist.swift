import Foundation
import ScriptingBridge

@objc protocol iTunesRadioTunerPlaylist : iTunesPlaylist
{
	// methods
	@objc optional func URLTracks() -> SBElementArray
}

extension SBObject : iTunesRadioTunerPlaylist
{
}

// the radio tuner playlist
public class RadioTunerPlaylist : Playlist
{
	internal init(_ item: iTunesRadioTunerPlaylist) {
		_item = item
		super.init(item)
	}

	public var urlTracks: Array<UrlTrack> {
		get { return _item.URLTracks!().map { UrlTrack($0 as! iTunesURLTrack) } }
	}

	private var _item: iTunesRadioTunerPlaylist
}
