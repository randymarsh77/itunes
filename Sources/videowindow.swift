import Foundation
import ScriptingBridge

@objc protocol iTunesVideoWindow : iTunesWindow
{
}

extension SBObject : iTunesVideoWindow
{
}

// the video window
public class VideoWindow : Window
{
	internal init(_ item: iTunesVideoWindow) {
		_item = item
		super.init(item)
	}

	private var _item: iTunesVideoWindow
}
