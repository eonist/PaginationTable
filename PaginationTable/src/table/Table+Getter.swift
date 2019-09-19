import Foundation
/**
 * Getter
 */
extension Table {
   /**
    * Returns the total amount of items excisting
    */
   func getTotalItemsCount() -> Int {
      return TrackPaginationService.getTotalItemsCount()
   }
}
