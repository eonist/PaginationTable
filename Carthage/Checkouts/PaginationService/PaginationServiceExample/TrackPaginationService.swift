import Foundation
import FileSugar
import JSONSugar
import PaginationServiceiOS
/**
 * Shows how you can get more complex paginated data by just providing a Decodable struct and a json asset
 * ## Examples:
 * TrackPaginationService.getItems(index: 0, length: 50) { success, tracks in Swift.print("success: \(success) artistName: \(String(describing: tracks.first?.artistName)) count: \(tracks.count)") }
 * TrackPaginationService.getItems(index: 120, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } // 30
 * TrackPaginationService.getItems(index: 160, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } //false, 0
 */
class TrackPaginationService: PaginationService<Track> {
   override class var filePath: String { return Bundle.main.resourcePath! + "/assets.bundle/tracks.json" } // the resources to load from
   static var __items: [Track]?
   override class var _items: [Track]? {
      get { return __items }
      set { __items = newValue }
   }
}
