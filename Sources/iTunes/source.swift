import Foundation
import ScriptingBridge

@objc internal protocol iTunesSource : iTunesItem
{
	// properties as readonly
	@objc optional var capacity: Int64 { get }
	@objc optional var freeSpace: Int64 { get }
	@objc optional var kind: NSString { get }

	// methods
	@objc optional func audioCDPlaylists() -> SBElementArray
	@objc optional func libraryPlaylists() -> SBElementArray
	@objc optional func playlists() -> SBElementArray
	@objc optional func radioTunerPlaylists() -> SBElementArray
	@objc optional func subscriptionPlaylists() -> SBElementArray
	@objc optional func userPlaylists() -> SBElementArray
	@objc optional func eject()
	@objc optional func update()
}

extension SBObject : iTunesSource
{
}

public enum SourceKind : String
{
	case Library = "kLib"
	case IPod = "kPod"
	case AudioCD = "kACD"
	case MP3CD = "kMCD"
	case RadioTuner = "kTun"
	case SharedLibrary = "kShd"
	case ITunesStore = "kITS"
	case Unknown = "kUnk"
}

public class Source : Item
{
	internal init(_ item: iTunesSource) {
		_item = item
		super.init(item)
	}

	// the total size of the source if it has a fixed size
	public var capacity: Int64 { get { return _item.capacity! } }

	// the free space on the source if it has a fixed size
	public var freeSpace: Int64 { get { return _item.freeSpace! } }

	public var kind: SourceKind { get { return SourceKind(rawValue: String(_item.kind!))! } }

	public var audioCDPlaylists: Array<AudioCDPlaylist> {
		get { return _item.audioCDPlaylists!().map { AudioCDPlaylist($0 as! iTunesAudioCDPlaylist) } }
	}

	public var libraryPlaylists: Array<LibraryPlaylist> {
		get { return _item.libraryPlaylists!().map { LibraryPlaylist($0 as! iTunesLibraryPlaylist) } }
	}

	public var playlists: Array<Playlist> {
		get { return _item.playlists!().map { Playlist($0 as! iTunesPlaylist) } }
	}

	public var radioTunerPlaylists: Array<RadioTunerPlaylist> {
		get { return _item.radioTunerPlaylists!().map { RadioTunerPlaylist($0 as! iTunesRadioTunerPlaylist) } }
	}

	public var subscriptionPlaylists: Array<Playlist> {
		get { return _item.subscriptionPlaylists!().map { Playlist($0 as! iTunesPlaylist) } }
	}

	public var userPlaylists: Array<UserPlaylist> {
		get { return _item.userPlaylists!().map { UserPlaylist($0 as! iTunesUserPlaylist) } }
	}

	// eject the specified iPod
	public func eject() {
		_item.eject!()
	}

	// update the specified iPod
	public func update() {
		_item.update!()
	}

	private var _item: iTunesSource
}
