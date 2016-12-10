import Foundation
import ScriptingBridge

@objc internal protocol iTunesItem
{
	// properties as readonly
	@objc optional var container: SBObject { get }
	@objc optional var id: NSInteger { get }
	@objc optional var index: NSInteger { get }
	@objc optional var name: String { get }
	@objc optional var persistentID: String { get }
	@objc optional var properties: NSDictionary { get }

	// setters for settable properties
	@objc optional func setName(_ name: String)

	// methods
	@objc optional func download()
	@objc optional func reveal()
}

extension SBObject : iTunesItem
{
}

public class Item
{
	// the container of the item
	public var container: SBObject? { get { return _item.container } }

	// the id of the item
	public var id: Int { get { return _item.id! } }

	// The index of the item in internal application order
	public var index: Int { get { return _item.index! } }

	// the name of the item
	public var name: String {
		get { return _item.name! }
		set(value) { _item.setName!(value) }
	}

	// the id of the item as a hexadecimal string. This id does not change over time.
	public var persistentId: String { get { return _item.persistentID! } }

	// the id of the item as a hexadecimal string. This id does not change over time.
	public var properties: Dictionary<String, Any> { get { return _item.properties! as! Dictionary<String, Any> } }

	// download a cloud track or playlist, or a podcast episode
	public func download() {
		_item.download!()
	}

	// reveal and select a track or playlist
	public func reveal() {
		_item.reveal!()
	}

	internal init(_ item: iTunesItem) {
		_item = item
	}

	private var _item: iTunesItem
}
