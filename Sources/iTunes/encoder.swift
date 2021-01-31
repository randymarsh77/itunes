import Foundation
import ScriptingBridge

@objc internal protocol iTunesEncoder : iTunesItem
{
	// properties as readonly
	@objc optional var format: NSString { get }
}

extension SBObject : iTunesEncoder
{
}

// converts a track to a specific file format
public class Encoder : Item
{
	internal init(_ item: iTunesEncoder) {
		_item = item
		super.init(item)
	}

	// the data format created by the encoder
	public var format: String { get { return _item.format! as String } }

	private var _item: iTunesEncoder
}
