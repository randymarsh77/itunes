import AppKit
import Foundation
import ScriptingBridge

@objc internal protocol iTunesArtwork : iTunesItem
{
	// properties as readonly
	@objc optional var data: NSImage { get }
	@objc optional var objectDescription: String { get }
	@objc optional var downloaded: Bool { get }
	@objc optional var format: NSNumber { get }
	@objc optional var kind: NSInteger { get }
	@objc optional var rawData: NSData { get }

	// setters for settable properties
	@objc optional func setData(_ value: NSImage)
	@objc optional func setObjectDescription(_ value: String)
	@objc optional func setKind(_ value: NSInteger)
	@objc optional func setRawData(_ value: NSData)
}

extension SBObject : iTunesArtwork
{
}

// a piece of art within a track or playlist
public class Artwork : Item
{
	internal init(_ item: iTunesArtwork) {
		_item = item
		super.init(item)
	}

	// data for this artwork, in the form of a picture
	public var image: NSImage {
		get { return _item.data! }
		set(value) { _item.setData!(value) }
	}

	// description of artwork as a string
	public var objectDescription: String {
		get { return _item.objectDescription! }
		set(value) { _item.setObjectDescription!(value) }
	}

	// was this artwork downloaded by iTunes?
	public var downloaded: Bool { get { return _item.downloaded! } }

	// the data format for this piece of artwork
	public var format: Int { get { return Int(_item.format!) } }

	// kind or purpose of this piece of artwork
	public var kind: Int {
		get { return _item.kind! }
		set(value) { _item.setKind!(value) }
	}

	// data for this artwork, in original format
	public var data: Data {
		get { return _item.rawData! as Data }
		set(value) { _item.setRawData!(value as NSData) }
	}

	private var _item: iTunesArtwork
}
