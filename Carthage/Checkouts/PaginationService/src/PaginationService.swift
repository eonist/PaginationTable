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
   open class var _items: [T]? { get { fatalError("must be overriden in subclass") } set { _ = newValue; fatalError("must be overriden in subclass") } }
   open class var networkLatency: Range<Int> { return (1..<4) }
   open class var filePath: String { fatalError("must be overriden in subclass") }
   open class var items: [T] {
      if let _items = _items {
         return _items
      } else {
         let items: [T] = getItems(filePath: filePath)
         _items = items // store in cache
         return items
      }
   }
   /**
    * Simulate a pagination call for a specified range of data (get file content)
    */
   public class func getItems(index: Int, length: Int, complete: @escaping GetItemsComplete) {  // we might have to use a method to be able to use T
      DispatchQueue.global(qos: .background).async {
         sleep(UInt32(networkLatency.randomElement()!)) // sleep between 1 and 4 secs to simulate network call
         guard index < items.count else { complete(false, []); return } // index out of bound, return false
         let min = Swift.min(index + length, items.count)
         let range = (index..<min)
         let retVal = Array(items[range])
         complete(true, retVal)
      }
   }
}
/**
 * Data
 */
extension PaginationService {
   /**
    * Returns
    * - Abstract: gets json from local file and converts it into an array
    */
   /*open*/ class func getItems(filePath: String) -> [T] {
      //      Swift.print("getItems(filePath)")
      guard let jsonStr: String = try? String(contentsOfFile: filePath, encoding: .utf8) as String else { Swift.print("no json at filepath"); return [] }
      return getItems(str: jsonStr)
   }
   /**
    * Returns playlist data for json string
    */
   /*open*/ class func getItems(str: String) -> [T] {
      //      Swift.print("getItems(str)")
      guard let jsonData = str.data(using: .utf8) else { fatalError("unable to convert string to data") }
      do {
         guard let items: [T] = try decode(data: jsonData) else { print("unable to decode"); return [] }//From json to struct {
         //playlistCellData.forEach { Swift.print("$0.artistName:  \($0.artistName) $0.songTitle:  \($0.songTitle)") }
         return items // return result
      } catch let jsonErr {
         print("Error serializing json", jsonErr)
         return [] // return empty array
      }
   }
}
extension PaginationService {
   public typealias GetItemsComplete = (_ success: Bool, _ items: [T]) -> Void
}
