import Foundation
/**
 * Getter
 */
extension Table {
   /**
    * Asserts if the table is scrolled all the way to the bottom
    */
   var isBottom: Bool { return (self.contentOffset.y + self.frame.size.height) >= self.contentSize.height }
   /**
    * Returns the next pagination range according to index and max possible items
    */
   var paginationRange: PaginationRange {
      let from: Int = Swift.min(paginationIndex, TrackPaginationService.items.count) // Ensures that start is never more than end
      let to: Int = Swift.min(paginationIndex + Table.paginationAmount, TrackPaginationService.items.count) // Ensures that end is necer more than available .count of datasource
      return (from, to)
   }
}
/**
 * Type
 */
extension Table {
   typealias PaginationRange = (from: Int, to: Int)
}
