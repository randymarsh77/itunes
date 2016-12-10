import Foundation
import ScriptingBridge

@objc protocol iTunesEQWindow : iTunesWindow
{
}

extension SBObject : iTunesEQWindow
{
}

public class EQWindow : Window
{
	internal init(_ item: iTunesEQWindow) {
		_item = item
		super.init(item)
	}

	private var _item: iTunesEQWindow
}
