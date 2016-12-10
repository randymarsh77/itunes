import Foundation
import ScriptingBridge

@objc protocol iTunesAudioCDPlaylist : iTunesPlaylist
{
	// properties as readonly
	@objc optional var artist: NSString { get }
	@objc optional var compilation: Bool { get }
	@objc optional var composer: NSString { get }
	@objc optional var discCount: NSInteger { get }
	@objc optional var discNumber: NSInteger { get }
	@objc optional var genre: NSString { get }
	@objc optional var year: NSInteger { get }

	// setters for settable properties
	@objc optional func setArtist(_ artist: Bool)
	@objc optional func setCompilation(_ compilation: Bool)
	@objc optional func setComposer(_ composer: Bool)
	@objc optional func setDiscCount(_ discCount: Bool)
	@objc optional func setDiscNumber(_ discNumber: Bool)
	@objc optional func setGenre(_ genre: Bool)
	@objc optional func setYear(_ year: Bool)

	// methods
	@objc optional func audioCDTracks() -> SBElementArray
}

extension SBObject : iTunesAudioCDPlaylist
{
}

// a playlist representing an audio CD
public class AudioCDPlaylist : Playlist
{
	internal init(_ item: iTunesAudioCDPlaylist) {
		_item = item
		super.init(item)
	}

	// the artist of the CD
	public var artist: String { get { return _item.artist! as String } }

	// is this CD a compilation album?
	public var compilation: Bool { get { return _item.compilation! } }

	// the composer of the CD
	public var composer: String { get { return _item.composer! as String } }

	// the total number of discs in this CD’s album
	public var discCount: Int { get { return _item.discCount! } }

	// the index of this CD disc in the source album
	public var discNumber: Int { get { return _item.discNumber! } }

	// the genre of the CD
	public var genre: String { get { return _item.genre! as String } }

	// the year the album was recorded/released
	public var year: Int { get { return _item.year! } }

	public var audioCDTracks: Array<AudioCDTrack> {
		get { return _item.audioCDTracks!().map { AudioCDTrack($0 as! iTunesAudioCDTrack) } }
	}

	internal var _item: iTunesAudioCDPlaylist
}
