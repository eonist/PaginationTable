import Foundation
import FileSugar
import JSONSugar
/**
 * Data (Public API)
 */
extension PaginationService {
   /**
    * Simulate a pagination call for a specified range of data (get file content)
    * - Abstract: This is the Outward main API call for users to consume.
    * - Parameter index: the start index for the items you want
    * - Parameter length: the number of items from start index you want
    * - Parameter complete: the completion call-back
    */
   public class func getItems(index: Int, length: Int, complete: @escaping GetItemsCompleted) {  // We might have to use a method to be able to use T
      DispatchQueue.global(qos: .background).async {
         sleep(UInt32(networkLatency.randomElement()!)) // Sleep between 1 and 4 secs to simulate network call
         guard index < items.count else { complete(.failure(.noItemAtThatIndex)); return } // Index out of bound, return false
         let min = Swift.min(index + length, items.count)
         let range = (index..<min)
         let retVal = Array(items[range])
         complete(.success(retVal))
      }
   }
   /**
    * Returns the total amount of items excisting
    */
   public class func getTotalItemsCount() -> Int {
      return items.count
   }
}
/**
 * Internal helper method
 */
extension PaginationService {
   /**
    * Returns the entire content for the service to then iterate over and return items in chunks
    * - Abstract: gets json from local file and converts it into an array
    * - Parameter filePath: The filePath to the json data (must be tildeExpanded)
    * ## Examples:
    * getItems(Bundle.main.resourcePath! + "/assets.bundle/items.json")
    */
   internal class func getItems(filePath: String) -> [T] {
      guard let jsonStr: String = try? String(contentsOfFile: filePath, encoding: .utf8) as String else { Swift.print("no json at filepath"); return [] }
      return getItems(str: jsonStr)
   }
}
/**
 * Private helper method
 */
extension PaginationService {
   /**
    * Returns array of items for a json string
    * - Parameter str: The json string content to convert into an array
    * - Note: The json content should be an json array with items Ie: `["", "", ""]` or [{"title": "Doctor"}, {"Gender": "female"}]
    */
   private class func getItems(str: String) -> [T] {
      guard let jsonData = str.data(using: .utf8) else { fatalError("Unable to convert string to data") }
      do {
         guard let items: [T] = try decode(data: jsonData) else { print("Unable to decode"); return [] } // From json to struct {
         return items // Return result
      } catch let jsonErr {
         print("Error serializing json", jsonErr)
         return [] // Return empty array
      }
   }
}
