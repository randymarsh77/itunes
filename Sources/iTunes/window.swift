import AppKit
import Foundation
import ScriptingBridge

@objc protocol iTunesWindow : iTunesItem
{
	// properties as readonly
	@objc optional var bounds: NSRect { get }
	@objc optional var closeable: Bool { get }
	@objc optional var collapseable: Bool { get }
	@objc optional var collapsed: Bool { get }
	@objc optional var fullScreen: Bool { get }
	@objc optional var position: NSPoint { get }
	@objc optional var resizable: Bool { get }
	@objc optional var visible: Bool { get }
	@objc optional var zoomable: Bool { get }
	@objc optional var zoomed: Bool { get }

	// setters for settable properties
	@objc optional func setBounds(_ bounds: NSRect)
	@objc optional func setCollapsed(_ collapsed: Bool)
	@objc optional func setFullScreen(_ fullScreen: Bool)
	@objc optional func setPosition(_ position: NSPoint)
	@objc optional func setVisible(_ visible: Bool)
	@objc optional func setZoomed(_ zoomed: Bool)
}

extension SBObject : iTunesWindow
{
}

// any window
public class Window : Item
{
	internal init(_ item: iTunesWindow) {
		_item = item
		super.init(item)
	}

	// the boundary rectangle for the window
	public var bounds: NSRect {
		get { return _item.bounds! }
		set(value) { _item.setBounds!(value) }
	}

	// does the window have a close button?
	public var closeable: Bool {
		get { return _item.closeable! }
	}

	// does the window have a collapse button?
	public var collapseable: Bool {
		get { return _item.collapseable! }
	}

	// is the window collapsed?
	public var collapsed: Bool {
		get { return _item.collapsed! }
		set(value) { _item.setCollapsed!(value) }
	}

	// is the window full screen?
	public var fullscreen: Bool {
		get { return _item.fullScreen! }
		set(value) { _item.setFullScreen!(value) }
	}

	// the upper left position of the window
	public var position: NSPoint {
		get { return _item.position! }
		set(value) { _item.setPosition!(value) }
	}

	// is the window resizable?
	public var resizabe: Bool {
		get { return _item.resizable! }
	}

	// is the window visible?
	public var visible: Bool {
		get { return _item.visible! }
		set(value) { _item.setVisible!(value) }
	}

	// is the window zoomable?
	public var zoomable: Bool {
		get { return _item.zoomable! }
	}

	// is the window zoomed?
	public var zoomed: Bool {
		get { return _item.zoomed! }
		set(value) { _item.setZoomed!(value) }
	}

	private var _item: iTunesWindow
}
