import Foundation
import FileSugar
import JSONSugar
/**
 * Data (Public API)
 */
extension PaginationService {
   /**
    * Simulate a pagination call for a specified range of data (get file content)
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
}
/**
 * Internal helper method
 */
extension PaginationService {
   /**
    * Returns
    * - Abstract: gets json from local file and converts it into an array
    */
   class func getItems(filePath: String) -> [T] {
      guard let jsonStr: String = try? String(contentsOfFile: filePath, encoding: .utf8) as String else { Swift.print("no json at filepath"); return [] }
      return getItems(str: jsonStr)
   }
}
/**
 * Private helper method
 */
extension PaginationService {
   /**
    * Returns playlist data for json string
    */
   private class func getItems(str: String) -> [T] {
      guard let jsonData = str.data(using: .utf8) else { fatalError("unable to convert string to data") }
      do {
         guard let items: [T] = try decode(data: jsonData) else { print("unable to decode"); return [] }//From json to struct {
         return items // Return result
      } catch let jsonErr {
         print("Error serializing json", jsonErr)
         return [] // Return empty array
      }
   }
}
