import Foundation
import ScriptingBridge

@objc internal protocol iTunesPrintSettings
{
	// properties as readonly
	@objc optional var copies: NSInteger { get }
	@objc optional var collating: Bool { get }
	@objc optional var startingPage: NSInteger { get }
	@objc optional var endingPage: NSInteger { get }
	@objc optional var pagesAcross: NSInteger { get }
	@objc optional var pagesDown: NSInteger { get }
	@objc optional var errorHandling: NSString { get }
	@objc optional var requestedPrintTime: NSDate { get }
	@objc optional var printerFeatures: NSArray { get }
	@objc optional var faxNumber: NSString { get }
	@objc optional var targetPrinter: NSString { get }
}

extension SBObject : iTunesPrintSettings
{
}

public enum ErrorHandling : String
{
	case Standard = "lwst" /* Standard PostScript error handling */
	case Detailed = "lwdt" /* print a detailed report of PostScript errors */
}

public class PrintSettings
{
	internal init(_ item: iTunesPrintSettings) {
		_item = item
	}

	// the number of copies of a document to be printed
	public var copies: Int { get { return _item.copies! } }

	// Should printed copies be collated?
	public var collating: Bool { get { return _item.collating! } }

	// the first page of the document to be printed
	public var startingPage: Int { get { return _item.startingPage! } }

	// the last page of the document to be printed
	public var endingPage: Int { get { return _item.endingPage! } }

	// number of logical pages laid across a physical page
	public var pagesAcross: Int { get { return _item.pagesAcross! } }

	// number of logical pages laid out down a physical page
	public var pagesDown: Int { get { return _item.pagesDown! } }

	// how errors are handled
	public var errorHandling: ErrorHandling { get { return ErrorHandling(rawValue: String(_item.errorHandling!))! } }

	// the time at which the desktop printer should print the document
	public var requestedPrintTime: Date { get { return _item.requestedPrintTime! as Date } }

	// printer specific options
	public var printerFeatures: Array<Any> { get { return _item.printerFeatures! as! Array<Any> } }

	// for fax number
	public var faxNumber: String { get { return _item.faxNumber! as String } }

	// for target printer
	public var targetPrinter: String { get { return _item.targetPrinter! as String } }

	internal var wrappedItem: iTunesPrintSettings { get { return _item } }

	private var _item: iTunesPrintSettings
}
