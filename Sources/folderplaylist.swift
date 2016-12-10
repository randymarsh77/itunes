import Foundation
import ScriptingBridge

@objc protocol iTunesFolderPlaylist : iTunesUserPlaylist
{
}

extension SBObject : iTunesFolderPlaylist
{
}

public class FolderPlaylist : UserPlaylist
{
	internal init(_ item: iTunesFolderPlaylist) {
		_item = item
		super.init(item)
	}

	private var _item: iTunesFolderPlaylist
}
