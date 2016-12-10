import Foundation
import ScriptingBridge

@objc protocol iTunesUserPlaylist : iTunesPlaylist
{
	// properties as readonly
	@objc optional var shared: Bool { get }
	@objc optional var smart: Bool { get }
	@objc optional var genius: Bool { get }

	// setters for settable properties
	@objc optional func setShared(_ shared: Bool)

	// methods
	@objc optional func fileTracks() -> SBElementArray
	@objc optional func URLTracks() -> SBElementArray
	@objc optional func sharedTracks() -> SBElementArray
}

extension SBObject : iTunesUserPlaylist
{
}

// custom playlists created by the user
public class UserPlaylist : Playlist
{
	internal init(_ item: iTunesUserPlaylist) {
		_item = item
		super.init(item)
	}

	// is this playlist shared?
	public var shared: Bool {
		get { return _item.shared! }
		set(value) { _item.setShared!(value) }
	}

	// is this a Smart Playlist?
	public var smart: Bool { get { return _item.smart! } }

	// is this a Genius Playlist?
	public var genius: Bool { get { return _item.genius! } }

	private var _item: iTunesUserPlaylist
}
