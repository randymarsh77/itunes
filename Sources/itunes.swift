import ScriptingBridge

@objc protocol iTunesApplication
{
	// properties as readonly
	@objc optional var AirPlayEnabled: Bool { get }
	@objc optional var currentAirPlayDevices: NSArray { get }
	@objc optional var currentEncoder: iTunesEncoder { get }
	@objc optional var currentEQPreset: iTunesEQPreset { get }
	@objc optional var currentPlaylist: iTunesPlaylist { get }
	@objc optional var currentStreamTitle: NSString { get }
	@objc optional var currentStreamURL: NSString { get }
	@objc optional var currentTrack: iTunesTrack { get }
	@objc optional var currentVisual: iTunesVisual { get }
	@objc optional var EQEnabled: Bool { get }
	@objc optional var fixedIndexing: Bool { get }
	@objc optional var frontmost: Bool { get }
	@objc optional var fullScreen: Bool { get }
	@objc optional var name: NSString { get }
	@objc optional var mute: Bool { get }
	@objc optional var playerPosition: Double { get }
	@objc optional var playerState: NSString { get }
	@objc optional var selection: SBObject { get }
	@objc optional var shuffleEnabled: Bool { get }
	@objc optional var shuffleMode: NSString { get }
	@objc optional var songRepeat: NSString { get }
	@objc optional var soundVolume: NSInteger { get }
	@objc optional var version: NSString { get }
	@objc optional var visualsEnabled: Bool { get }
	@objc optional var visualSize: NSString { get }

	// setters for settable properties
	@objc optional func setCurrentAirplayDevices(_ currentAirPlayDevices: String)
	@objc optional func setCurrentEncoder(_ currentEncoder: String)
	@objc optional func setCurrentEQPreset(_ currentEQPreset: String)
	@objc optional func setCurrentVisual(_ currentVisual: iTunesVisual)
	@objc optional func setEQEnabled(_ EQEnabled: Bool)
	@objc optional func setFixedIndexing(_ fixedIndexing: Bool)
	@objc optional func setFrontmost(_ frontmost: Bool)
	@objc optional func setFullscreen(_ fullscreen: Bool)
	@objc optional func setMute(_ mute: Bool)
	@objc optional func setShuffleEnabled(_ shuffleEnabled: Bool)
	@objc optional func setShuffleMode(_ shuffleMode: Bool)
	@objc optional func setSongRepeat(_ songRepeat: Bool)
	@objc optional func setSoundVolume(_ soundVolume: Bool)
	@objc optional func setVisualsEnabled(_ visualsEnabled: Bool)
	@objc optional func setVisualSize(_ visualSie: Bool)

	// methods
	@objc optional func AirPlayDevices() -> SBElementArray
	@objc optional func browserWindows() -> SBElementArray
	@objc optional func encoders() -> SBElementArray
	@objc optional func EQPresets() -> SBElementArray
	@objc optional func EQWindows() -> SBElementArray
	@objc optional func miniplayerWindows() -> SBElementArray
	@objc optional func playlistWindows() -> SBElementArray
	@objc optional func sources() -> SBElementArray
	@objc optional func videoWindows() -> SBElementArray
	@objc optional func visuals() -> SBElementArray
	@objc optional func windows() -> SBElementArray
	@objc optional func printPrintDialog(_ printDialog: Bool, _ withProperties: iTunesPrintSettings, _ kind: NSString, _ theme: NSString) -> Void
	@objc optional func run() -> Void
	@objc optional func quit() -> Void
	@objc optional func add(_ x: NSArray, _ to: SBObject) -> iTunesTrack
	@objc optional func backTrack() -> Void
	@objc optional func convert(_ x: NSArray) -> UnsafePointer<iTunesTrack>?
	@objc optional func eject() -> Void
	@objc optional func fastForward() -> Void
	@objc optional func nextTrack() -> Void
	@objc optional func pause() -> Void
	@objc optional func playOnce(_ once: Bool) -> Void
	@objc optional func playpause() -> Void
	@objc optional func previousTrack() -> Void
	@objc optional func resume() -> Void
	@objc optional func rewind() -> Void
	@objc optional func stop() -> Void
	@objc optional func subscribe(_ x: NSString) -> Void
	@objc optional func update() -> Void
	@objc optional func updateAllPodcasts() -> Void
	@objc optional func updatePodcast() -> Void
	@objc optional func openLocation(_ x: NSString) -> Void
}

extension SBApplication : iTunesApplication {}

public enum PlayerState : String
{
	case Stopped = "kPSS"
	case Playing = "kPSP"
	case Paused = "kPSp"
	case FastForwarding = "kPSF"
	case Rewinding = "kPSR"
}

public enum ShuffleMode : String
{
	case Songs = "kShS"
	case Albums = "kShA"
	case Groupings = "kShG"
}

public enum Repeat : String
{
	case Off = "kRpO"
	case One = "kRp1"
	case All = "kAll"
};

public enum VisualSize : String
{
	case Small = "kVSS"
	case Medium = "kVSM"
	case Large = "kVSL"
};

public enum Kind : String
{
	case TrackListing = "kTrk" /* a basic listing of tracks within a playlist */
	case AlbumListing = "kAlb" /* a listing of a playlist grouped by album */
	case CdInsert = "kCDi" /* a printout of the playlist for jewel case inserts */
};

public class iTunes
{
	public static func Instance() -> iTunes {
		let app = SBApplication(bundleIdentifier: "com.apple.iTunes")
		return iTunes(app as! iTunesApplication)
	}

	public var airPlayDevices: Array<AirPlayDevice> {
		get { return _item.AirPlayDevices!().map { AirPlayDevice($0 as! iTunesAirPlayDevice) } }
	}

	public var browserWindows: Array<BrowserWindow> {
		get { return _item.browserWindows!().map { BrowserWindow($0 as! iTunesBrowserWindow) } }
	}

	public var encoders: Array<Encoder> {
		get { return _item.encoders!().map { Encoder($0 as! iTunesEncoder) } }
	}

	public var eqPresets: Array<EQPreset> {
		get { return _item.EQPresets!().map { EQPreset($0 as! iTunesEQPreset) } }
	}

	public var eqWindows: Array<EQWindow> {
		get { return _item.EQWindows!().map { EQWindow($0 as! iTunesEQWindow) } }
	}

	public var miniplayerWindows: Array<MiniplayerWindow> {
		get { return _item.miniplayerWindows!().map { MiniplayerWindow($0 as! iTunesMiniplayerWindow) } }
	}

	public var playlistWindows: Array<PlaylistWindow> {
		get { return _item.playlistWindows!().map { PlaylistWindow($0 as! iTunesPlaylistWindow) } }
	}

	public var sources: Array<AirPlayDevice> {
		get { return _item.sources!().map { AirPlayDevice($0 as! iTunesAirPlayDevice) } }
	}

	public var videoWindows: Array<VideoWindow> {
		get { return _item.videoWindows!().map { VideoWindow($0 as! iTunesVideoWindow) } }
	}

	public var visuals: Array<Visual> {
		get { return _item.visuals!().map { Visual($0 as! iTunesVisual) } }
	}

	public var windows: Array<Window> {
		get { return _item.windows!().map { Window($0 as! iTunesWindow) } }
	}

	// is AirPlay currently enabled?
	public var airPlayEnabled: Bool { get { return _item.AirPlayEnabled! } }

	// the currently selected AirPlay device(s)
	public var currentAirPlayDevices: Array<AirPlayDevice> {
		get { return _item.currentAirPlayDevices!.map { AirPlayDevice($0 as! iTunesAirPlayDevice) } }
	}

	// the currently selected encoder (MP3, AIFF, WAV, etc.)
	public var currentEncoder: Encoder {
		get { return Encoder(_item.currentEncoder!) }
	}

	// the currently selected equalizer preset
	public var currentEQPreset: EQPreset {
		get { return EQPreset(_item.currentEQPreset!) }
	}

	// the playlist containing the currently targeted track
	public var currentPlaylist: Playlist { get { return Playlist(_item.currentPlaylist!) } }

	// the name of the current song in the playing stream (provided by streaming server)
	public var currentStreamTitle: String { get { return _item.currentStreamTitle! as String } }

	// the URL of the playing stream or streaming web site (provided by streaming server)
	public var currentStreamUrl: String { get { return _item.currentStreamURL! as String } }

	// the current targeted track
	public var currentTrack: Track { get { return Track(_item.currentTrack!) } }

	// the currently selected visual plug-in
	public var currentVisual: Visual {
		get { return Visual(_item.currentVisual!) }
	}

	// is the equalizer enabled?
	public var eqEnabled: Bool {
		get { return _item.EQEnabled! }
	}

	// true if all AppleScript track indices should be independent of the play order of the owning playlist.
	public var fixedIndexing: Bool {
		get { return _item.fixedIndexing! }
	}

	// is iTunes the frontmost application?
	public var frontmost: Bool {
		get { return _item.frontmost! }
	}

	// are visuals displayed using the entire screen?
	public var fullScreen: Bool {
		get { return _item.fullScreen! }
	}

	// the name of the application
	public var name: String { get { return _item.name! as String } }

	// has the sound output been muted?
	public var mute: Bool {
		get { return _item.mute! }
	}

	// the player’s position within the currently playing track in seconds.
	public var playerPosition: Double {
		get { return _item.playerPosition! }
	}

	// is iTunes stopped, paused, or playing?
	public var playerState: PlayerState { get { return PlayerState(rawValue: String(_item.playerState!))! } }

	// the selection visible to the user
	public var selection: Item { get { return Item(_item.selection!) } }

	// are songs played in random order?
	public var shuffleEnabled: Bool {
		get { return _item.shuffleEnabled! }
	}

	// the playback shuffle mode
	public var shuffleMode: ShuffleMode {
		get { return ShuffleMode(rawValue: String(_item.shuffleMode!))! }
	}

	// the playback repeat mode
	public var songRepeat: Repeat {
		get { return Repeat(rawValue: String(_item.songRepeat!))! }
	}

	// the sound output volume (0 = minimum, 100 = maximum)
	public var soundVolume: Int {
		get { return _item.soundVolume! }
	}

	// the version of iTunes
	public var version: String { get { return _item.version! as String } }

	// are visuals currently being displayed?
	public var visualsEnabled: Bool {
		get { return _item.visualsEnabled! }
	}

	// the size of the displayed visual
	public var visualSize: VisualSize {
		get { return VisualSize(rawValue: String(_item.visualSize!))! }
	}

	// Print the specified object(s)
	public func print(printDialog: Bool, settings: PrintSettings, kind: Kind, theme: String) {
		_item.printPrintDialog!(printDialog, settings.wrappedItem, kind.rawValue as NSString, theme as NSString)
	}

	// Run iTunes
	public func run() {

		_item.run!()
	}

	// Quit iTunes
	public func quit() {
		_item.quit!()
	}

	// add one or more files to a playlist
	public func add(files: Array<URL>, to: Playlist) -> Track {
		return Track(_item.add!(files as NSArray, to.wrappedItem as! SBObject))
	}

	// reposition to beginning of current track or go to previous track if already at start of current track
	public func backTrack() {
		_item.backTrack!()
	}

	// convert one or more files or tracks
	public func convert(tracks: Array<FileTrack>) -> Array<Track> {
		var tracks = Array<Track>()
		var rawTracks = _item.convert!(tracks.map { $0.wrappedItem } as NSArray)
		while rawTracks != nil && rawTracks?.pointee != nil {
			tracks.append(Track((rawTracks?.pointee)!))
			rawTracks = rawTracks?.advanced(by: MemoryLayout<iTunesTrack>.size)
		}
		return tracks
	}

	// eject the specified iPod
	public func eject() {
		_item.eject!()
	}

	// eject the specified iPod
	public func fastForward() {
		_item.fastForward!()
	}

	// advance to the next track in the current playlist
	public func nextTrack() {
		_item.nextTrack!()
	}

	// pause playback
	public func pause() {
		_item.pause!()
	}

	// play the current track or the specified track or file.
	public func play(once: Bool) {
		_item.playOnce!(once)
	}

	// toggle the playing/paused state of the current track
	public func playpause() {
		_item.playpause!()
	}

	// return to the previous track in the current playlist
	public func previousTrack() {
		_item.previousTrack!()
	}

	// disable fast forward/rewind and resume playback, if playing.
	public func resume() {
		_item.resume!()
	}

	// skip backwards in a playing track
	public func rewind() {
		_item.rewind!()
	}

	// stop playback
	public func stop() {
		_item.stop!()
	}

	// subscribe to a podcast feed
	public func subscribe(to: String) {
		_item.subscribe!(to as NSString)
	}

	// update the specified iPod
	public func update() {
		_item.update!()
	}

	// update all subscribed podcast feeds
	public func updateAllPodcasts() {
		_item.updateAllPodcasts!()
	}

	// update podcast feed
	public func updatePodcast() {
		_item.updatePodcast!()
	}

	// Opens a Music Store or audio stream URL
	public func open(location: String) {
		_item.openLocation!(location as NSString)
	}

	private init(_ item: iTunesApplication) {
		_item = item
	}

	private var _item: iTunesApplication
}
