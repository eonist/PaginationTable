import Foundation
import FileSugar
import JSONSugar
/**
 * A class to just get some pagination data quickly
 * - Parameter _items: Accessor to storage variable
 * - Parameter __items: the storage variable has to be in a non-generic class (concrete class)
 * - Parameter filePath: the resources to load from
 * ## Examples:
 * CustomPaginationService.getItems(index: 0, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } //true, 50
 * CustomPaginationService.getItems(index: 120, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } //true, 30
 * CustomPaginationService.getItems(index: 160, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } //false, 0
 */
public class CustomPaginationService: PaginationService<String> {
   override public class var filePath: String { return Bundle.main.resourcePath! + "/assets.bundle/items.json" }
   private static var __items: [String]?
   override public class var _items: [String]? {
      get { return __items }
      set { __items = newValue }
   }
}
