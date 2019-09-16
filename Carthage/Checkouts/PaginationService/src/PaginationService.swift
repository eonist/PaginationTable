import Foundation
import FileSugar
import JSONSugar
/**
 * - Parameter _items: caches the parsed items, We have to have this variable here, or else subclass wont have anything to override, also since >greneric classes cant have static stroage variables, only static get / set variables
 * - Parameter networkLatency: general network response time
 * - Parameter filePath: the resources to load from
 * - Parameter items: loads from file if items is not stored in cache yet
 * - Fixme: ⚠️️ rename items to getItems() and _items to items, and __items to _items ?
 */
open class PaginationService<T: Decodable> {
   open class var _items: [T]? { get { fatalError("Must be overriden in subclass") } set { _ = newValue; fatalError("Must be overriden in subclass") } }
   open class var networkLatency: Range<Int> { return (1..<4) }
   open class var filePath: String { fatalError("Must be overriden in subclass") }
   open class var items: [T] {
      if let _items = _items {
         return _items
      } else {
         let items: [T] = getItems(filePath: filePath)
         _items = items // Store in cache
         return items
      }
   }
}
