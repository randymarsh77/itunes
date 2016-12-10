import Foundation
import ScriptingBridge

@objc internal protocol iTunesTrack : iTunesItem
{
	// properties as readonly
	@objc optional var album: NSString { get }
	@objc optional var albumArtist: NSString { get }
	@objc optional var albumLoved: Bool { get }
	@objc optional var albumRating: NSInteger { get }
	@objc optional var albumRatingKind: NSString { get }
	@objc optional var artist: NSString { get }
	@objc optional var bitRate: NSInteger { get }
	@objc optional var bookmark: Double { get }
	@objc optional var bookmarkable: Bool { get }
	@objc optional var bpm: NSInteger { get }
	@objc optional var category: NSString { get }
	@objc optional var cloudStatus: NSString { get }
	@objc optional var comment: NSString { get }
	@objc optional var compilation: Bool { get }
	@objc optional var composer: NSString { get }
	@objc optional var databaseID: NSInteger { get }
	@objc optional var dateAdded: NSDate { get }
	@objc optional var objectDescription: NSString { get }
	@objc optional var discCount: NSInteger { get }
	@objc optional var discNumber: NSInteger { get }
	@objc optional var downloaderAppleID: NSString { get }
	@objc optional var downloaderName: NSString { get }
	@objc optional var duration: Double { get }
	@objc optional var enabled: Bool { get }
	@objc optional var episodeID: NSString { get }
	@objc optional var episodeNumber: NSInteger { get }
	@objc optional var EQ: NSString { get }
	@objc optional var finish: Double { get }
	@objc optional var gapless: Bool { get }
	@objc optional var genre: NSString { get }
	@objc optional var grouping: NSString { get }
	@objc optional var kind: NSString { get }
	@objc optional var longDescription: NSString { get }
	@objc optional var loved: Bool { get }
	@objc optional var lyrics: NSString { get }
	@objc optional var mediaKind: NSString { get }
	@objc optional var modificationDate: NSDate { get }
	@objc optional var playedCount: NSInteger { get }
	@objc optional var playedDate: NSDate { get }
	@objc optional var purchaserAppleID: NSString { get }
	@objc optional var purchaserName: NSString { get }
	@objc optional var rating: NSInteger { get }
	@objc optional var ratingKind: NSString { get }
	@objc optional var releaseDate: NSDate { get }
	@objc optional var sampleRate: NSInteger { get }
	@objc optional var seasonNumber: NSInteger { get }
	@objc optional var shufflable: Bool { get }
	@objc optional var skippedCount: NSInteger { get }
	@objc optional var skippedDate: NSDate { get }
	@objc optional var show: NSString { get }
	@objc optional var sortAlbum: NSString { get }
	@objc optional var sortArtist: NSString { get }
	@objc optional var sortAlbumArtist: NSString { get }
	@objc optional var sortName: NSString { get }
	@objc optional var sortComposer: NSString { get }
	@objc optional var sortShow: NSString { get }
	@objc optional var size: Int64 { get }
	@objc optional var start: Double { get }
	@objc optional var time: NSString { get }
	@objc optional var trackCount: NSInteger { get }
	@objc optional var trackNumber: NSInteger { get }
	@objc optional var unplayed: Bool { get }
	@objc optional var videoKind: NSString { get }
	@objc optional var volumeAdjustment: NSInteger { get }
	@objc optional var year: NSInteger { get }

	//set
	//album
	//albumArtist
	//albumLoved
	//albumRating
	//artist
	//bookmark
	//bookmarkable
	//bpm
	//category
	//comment
	//compilation
	//composer
	//objectDescription
	//discCount
	//discNumber
	//enabled
	//episodeId
	//episodeNumber
	//EQ
	//finish
	//gapless
	//genre
	//grouping
	//longDescription
	//loved
	//lyrics
	//mediaKind
	//playedCount
	//playedDate
	//rating
	//seasonNumber
	//shufflable
	//skippedCount
	//show
	//sortAlbum
	//sortArtist
	//sortAlbumArtist
	//sortName
	//sortComposer
	//sortShow
	//start
	//trackCount
	//trackNumber
	//unplayed
	//videoKind
	//volumeAdjustment
	//year

	// methods
	@objc optional func artworks() -> SBElementArray
}

extension SBObject : iTunesTrack
{
}

public enum RatingKind : String
{
	case User = "kRtU" /* user-specified rating */
	case Computed = "kRtC" /* iTunes-computed rating */
}

public enum CloudStatus : String
{
	case Unknown = "kUnk"
	case Purchased = "kPur"
	case Matched = "kMat"
	case Uploaded = "kUpl"
	case Ineligible = "kRej"
	case Removed = "kRem"
	case Error = "kErr"
	case Duplicate = "kDup"
	case Subscription = "kSub"
	case NoLongerAvailable = "kRev"
	case NotUploaded = "kUpP"
};

public enum MediaKind : String
{
	case AlertTone = "kMdL" /* alert tone track */
	case Audiobook = "kMdA" /* audiobook track */ 
	case Book =  "kMdB" /* book track */
	case HomeVideo = "kMdH" /* home video track */
	case ITunesU = "kMdI" /* iTunes U track */
	case Movie = "kMdM" /* movie track */
	case Music = "kMdS" /* music track */
	case MusicVideo = "kMdV" /* music video track */
	case Podcast = "kMdP" /* podcast track */
	case Ringtone = "kMdR" /* ringtone track */
	case TVShow = "kMdT" /* TV show track */ 
	case VoiceMemo = "kMdO" /* voice memo track */ 
	case Unknown = "kUnk"
}

public enum VideoKind : String
{
	case None = "kNon" /* not a video or unknown video kind */
	case HomeVideo = "kVdH" /* home video track */
	case Movie = "kVdM" /* movie track */
	case MusicVideo = "kVdV" /* music video track */
	case TVShow = "kVdT" /* TV show track */
}

// playable audio source
public class Track : Item
{
	internal init(_ item: iTunesTrack) {
		_item = item
		super.init(item)
	}

	public var artworks: Array<Artwork> { get { return _item.artworks!().map { Artwork($0 as! iTunesArtwork) } } }

	// the album name of the track
	public var album: String { get { return _item.album! as String } }

	// the album artist of the track
	public var albumArtist: String { get { return _item.albumArtist! as String } }

	// is the album for this track loved?
	public var albumLoved: Bool { get { return _item.albumLoved! } }

	// the rating of the album for this track (0 to 100)
	public var albumRating: Int { get { return _item.albumRating! } }

	// the rating kind of the album rating for this track
	public var albumRatingKind: RatingKind { get { return RatingKind(rawValue: String(_item.albumRatingKind!))! } }

	// the artist/source of the track
	public var artist: String { get { return _item.artist! as String } }

	// the bit rate of the track (in kbps)
	public var bitRate: Int { get { return _item.bitRate! } }

	// the bookmark time of the track in seconds
	public var bookmark: Double { get { return _item.bookmark! } }

	// is the playback position for this track remembered?
	public var bookmarkable: Bool { get { return _item.bookmarkable! } }

	// the tempo of this track in beats per minute
	public var bpm: Int { get { return _item.bpm! } }

	// the category of the track
	public var category: String { get { return _item.category! as String } }

	// the iCloud status of the track
	public var cloudStatus: CloudStatus { get { return CloudStatus(rawValue: String(_item.cloudStatus!))! } }

	// freeform notes about the track
	public var comment: String { get { return _item.comment! as String } }

	// is this track from a compilation album?
	public var compilation: Bool { get { return _item.compilation! } }

	// the composer of the track
	public var composer: String { get { return _item.composer! as String } }

	// the common, unique ID for this track. If two tracks in different playlists have the same database ID, they are sharing the same data.
	public var databaseID: Int { get { return _item.databaseID! } }

	// the date the track was added to the playlist
	public var dateAdded: Date { get { return _item.dateAdded! as Date } }

	// the description of the track
	public var objectDescription: String { get { return _item.objectDescription! as String } }

	// the total number of discs in the source album
	public var discCount: Int { get { return _item.discCount! } }

	// the index of the disc containing this track on the source album
	public var discNumber: Int { get { return _item.discNumber! } }

	// the Apple ID of the person who downloaded this track
	public var downloaderAppleId: String { get { return _item.downloaderAppleID! as String } }

	// the name of the person who downloaded this track
	public var downloaderName: String { get { return _item.downloaderName! as String } }

	// the length of the track in seconds
	public var duration: Double { get { return _item.duration! } }

	// is this track checked for playback?
	public var enabled: Bool { get { return _item.enabled! } }

	// the episode ID of the track
	public var episodeId: String { get { return _item.episodeID! as String } }

	// the episode number of the track
	public var episodeNumber: Int { get { return _item.episodeNumber! } }

	// the name of the EQ preset of the track
	public var eq: String { get { return _item.EQ! as String } }

	// the stop time of the track in seconds
	public var finish: Double { get { return _item.finish! } }

	// is this track from a gapless album?
	public var gapless: Bool { get { return _item.gapless! } }

	// the music/audio genre (category) of the track
	public var genre: String { get { return _item.genre! as String } }

	// the grouping (piece) of the track. Generally used to denote movements within a classical work.
	public var grouping: String { get { return _item.grouping! as String } }

	// a text description of the track
	public var kind: String { get { return _item.kind! as String } }

	public var longDescription: String { get { return _item.longDescription! as String } }

	// is this track loved?
	public var loved: Bool { get { return _item.loved! } }

	// the lyrics of the track
	public var lyrics: String { get { return _item.lyrics! as String } }

	// the media kind of the track
	public var mediaKind: MediaKind { get { return MediaKind(rawValue: String(_item.mediaKind!))! } }

	// the modification date of the content of this track
	public var modificationDate: Date { get { return _item.modificationDate! as Date } }

	// number of times this track has been played
	public var playedCount: Int { get { return _item.playedCount! } }

	// the date and time this track was last played
	public var playedDate: Date { get { return _item.playedDate! as Date } }

	// the Apple ID of the person who purchased this track
	public var purchaserAppleId: String { get { return _item.purchaserAppleID! as String } }

	// the name of the person who purchased this track
	public var purchaserName: String { get { return _item.purchaserName! as String } }

	// the rating of this track (0 to 100)
	public var rating: Int { get { return _item.rating! } }

	// the rating kind of this track
	public var ratingKind: RatingKind { get { return RatingKind(rawValue: String(_item.ratingKind!))! } }

	// the release date of this track
	public var releaseDate: Date { get { return _item.releaseDate! as Date } }

	// the sample rate of the track (in Hz)
	public var sampleRate: Int { get { return _item.sampleRate! } }

	// the season number of the track
	public var seasonNumber: Int { get { return _item.seasonNumber! } }

	// is this track included when shuffling?
	public var shufflable: Bool { get { return _item.shufflable! } }

	// number of times this track has been skipped
	public var skippedCount: Int { get { return _item.skippedCount! } }

	// the date and time this track was last skipped
	public var skippedDate: Date { get { return _item.skippedDate! as Date } }

	// the show name of the track
	public var show: String { get { return _item.show! as String } }

	// override string to use for the track when sorting by album
	public var sortAlbum: String { get { return _item.sortAlbum! as String } }

	// override string to use for the track when sorting by artist
	public var sortArtist: String { get { return _item.sortArtist! as String } }

	// override string to use for the track when sorting by album artist
	public var sortAlbumArtist: String { get { return _item.sortAlbumArtist! as String } }

	// override string to use for the track when sorting by name
	public var sortName: String { get { return _item.sortName! as String } }

	// override string to use for the track when sorting by composer
	public var sortComposer: String { get { return _item.sortComposer! as String } }

	// override string to use for the track when sorting by show name
	public var sortShow: String { get { return _item.sortShow! as String } }

	// the size of the track (in bytes)
	public var size: Int64 { get { return _item.size! } }

	// the start time of the track in seconds
	public var start: Double { get { return _item.start! } }

	// the length of the track in MM:SS format
	public var time: String { get { return _item.time! as String } }

	// the total number of tracks on the source album
	public var trackCount: Int { get { return _item.trackCount! } }

	// is this track unplayed?
	public var unplayed: Bool { get { return _item.unplayed! } }

	// kind of video track
	public var videoKind: VideoKind { get { return VideoKind(rawValue: String(_item.videoKind!))! } }

	// relative volume adjustment of the track (-100% to 100%)
	public var volumeAdjustment: Int { get { return _item.volumeAdjustment! } }

	// the year the track was recorded/released
	public var year: Int { get { return _item.year! } }

	internal var wrappedItem: iTunesTrack { get { return _item } }

	private var _item: iTunesTrack
}
