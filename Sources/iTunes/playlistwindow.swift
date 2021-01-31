import Foundation
import ScriptingBridge

@objc protocol iTunesPlaylistWindow : iTunesWindow
{
	// properties as readonly
	@objc optional var selection: SBObject { get }
	@objc optional var view: iTunesPlaylist { get }

	// setters for settable properties
	@objc optional func setView(_ view: iTunesPlaylist)
}

extension SBObject : iTunesPlaylistWindow
{
}

// a sub-window showing a single playlist
public class PlaylistWindow : Window
{
	internal init(_ item: iTunesPlaylistWindow) {
		_item = item
		super.init(item)
	}

	// the selected songs
	public var selection: SBObject { get { return _item.selection! } }

	// the playlist displayed in the window
	public var view: Playlist {
		get { return Playlist(_item.view!) }
		set(value) { _item.setView!(value.wrappedItem) }
	}

	private var _item: iTunesPlaylistWindow
}
