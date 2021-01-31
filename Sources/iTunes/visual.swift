import Foundation
import ScriptingBridge

@objc protocol iTunesVisual : iTunesItem
{
}

extension SBObject : iTunesVisual
{
}

// a visual plug-in
public class Visual : Item
{
	internal init(_ item: iTunesVisual) {
		_item = item
		super.init(item)
	}

	private var _item: iTunesVisual
}
