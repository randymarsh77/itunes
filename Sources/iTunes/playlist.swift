import Foundation
import ScriptingBridge

@objc internal protocol iTunesPlaylist : iTunesItem
{
	// properties as readonly
	@objc optional var objectDescription: String { get }
	@objc optional var duration: NSInteger { get }
	@objc optional var loved: Bool { get }
	@objc optional var parent: iTunesPlaylist { get }
	@objc optional var size: NSInteger { get }
	@objc optional var specialKind: String { get }
	@objc optional var time: String { get }
	@objc optional var visible: Bool { get }

	// setters for settable properties
	@objc optional func setObjectDescription(_ value: String)
	@objc optional func setName(_ value: String)
	@objc optional func setLoved(_ value: Bool)

	//methods
	@objc optional func tracks() -> SBElementArray
	@objc optional func artworks() -> SBElementArray
	@objc optional func moveTo(to: SBObject) -> Void
	@objc optional func searchFor(for_: String, only: String) -> UnsafePointer<iTunesTrack>?
}

extension SBObject : iTunesPlaylist
{
}

public enum PlaylistSpecialKind : String
{
	case None = "kNon"
	case Books = "kSpA"
	case Folder = "kSpF"
	case Genius = "kSpG"
	case ITunesU = "kSpU"
	case Library = "kSpL"
	case Movies = "kSpI"
	case Music = "kSpZ"
	case Podcasts = "kSpP"
	case PurchasedMusic = "kSpM"
	case TVShows = "kSpT"
}

public enum SearchField : String
{
	case Albums = "kSrL" /* albums only */
	case All = "kAll" /* all text fields */
	case Artists = "kSrR" /* artists only */
	case Composers = "kSrC" /* composers only */
	case Displayed = "kSrV" /* visible text fields */
	case Songs = "kSrS" /* song names only */
}

// a list of songs/streams
public class Playlist : Item
{
	internal init(_ item: iTunesPlaylist) {
		_item = item
		super.init(item)
	}

	public var tracks: Array<Track> { get { return _item.tracks!().map { Track($0 as! iTunesTrack) } } }

	public var artworks: Array<Artwork> { get { return _item.artworks!().map { Artwork($0 as! iTunesArtwork) } } }

	// the description of the playlist
	public var objectDescription: String {
		get { return _item.objectDescription! }
		set(value) { _item.setObjectDescription!(value) }
	}

	// the total length of all songs (in seconds)
	public var duration: Int { get { return _item.duration! } }

	// folder which contains this playlist (if any)
	public var parent: Playlist? { get { return _item.parent != nil ? Playlist(_item.parent!) : nil } }

	// the total size of all songs (in bytes)
	public var size: Int { get { return _item.size! } }

	// special playlist kind
	public var specialKind: PlaylistSpecialKind { get { return PlaylistSpecialKind(rawValue: _item.specialKind!)! } }

	// the length of all songs in MM:SS format
	public var time: String { get { return _item.time! } }

	// is this playlist visible in the Source list?
	public var visible: Bool { get { return _item.visible! } }

	// Move playlist(s) to a new location
	public func move(to: SBObject) {
		_item.moveTo!(to: to)
	}

	// search a playlist for tracks matching the search string. Identical to entering search text in the Search field in iTunes.
	public func search(query: String, only: SearchField) -> Array<Track> {
		var tracks = Array<Track>()
		var rawTracks = _item.searchFor!(for_: query, only: only.rawValue)
		while rawTracks != nil && rawTracks?.pointee != nil {
			tracks.append(Track((rawTracks?.pointee)!))
			rawTracks = rawTracks?.advanced(by: MemoryLayout<iTunesTrack>.size)
		}
		return tracks
	}

	internal var wrappedItem: iTunesPlaylist { get { return _item } }

	private var _item: iTunesPlaylist
}
