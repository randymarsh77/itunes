import Foundation
import ScriptingBridge

@objc protocol iTunesLibraryPlaylist : iTunesPlaylist
{
	// methods
	@objc optional func fileTracks() -> SBElementArray
	@objc optional func URLTracks() -> SBElementArray
	@objc optional func sharedTracks() -> SBElementArray
}

extension SBObject : iTunesLibraryPlaylist
{
}

// the master music library playlist
public class LibraryPlaylist : Playlist
{
	internal init(_ item: iTunesLibraryPlaylist) {
		_item = item
		super.init(item)
	}

	public var fileTracks: Array<FileTrack> {
		get { return _item.fileTracks!().map { FileTrack($0 as! iTunesFileTrack) } }
	}

	public var urlTracks: Array<UrlTrack> {
		get { return _item.URLTracks!().map { UrlTrack($0 as! iTunesURLTrack) } }
	}

	public var sharedTracks: Array<SharedTrack> {
		get { return _item.sharedTracks!().map { SharedTrack($0 as! iTunesSharedTrack) } }
	}

	private var _item: iTunesLibraryPlaylist
}
