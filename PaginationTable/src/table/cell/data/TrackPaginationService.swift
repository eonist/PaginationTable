import Foundation
import PaginationServiceiOS
typealias Track = ArtistAndSong
/**
 * Shows how you can get more complex paginated data by just providing a Decodable struct and a json asset
 */
class TrackPaginationService: PaginationService<Track> {
   override open class var filePath: String { return Bundle.main.resourcePath! + "/assets.bundle/artistandsongs.json" } // the resources to load from
   static var __items: [Track]?
   override class var _items: [Track]? {
      get { return __items }
      set { __items = newValue }
   }
}
