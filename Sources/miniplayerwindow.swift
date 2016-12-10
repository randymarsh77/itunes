import Foundation
import ScriptingBridge

@objc protocol iTunesMiniplayerWindow : iTunesWindow
{
}

extension SBObject : iTunesMiniplayerWindow
{
}

// the miniplayer window
public class MiniplayerWindow : Window
{
	internal init(_ item: iTunesMiniplayerWindow) {
		_item = item
		super.init(item)
	}

	private var _item: iTunesMiniplayerWindow
}
