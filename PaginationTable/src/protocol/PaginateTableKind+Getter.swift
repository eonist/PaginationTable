import UIKit
/**
 * Getter
 */
extension PaginateTableKind where Self: UITableView {
   /**
    * Asserts if the table is scrolled all the way to the bottom
    */
   public var isBottom: Bool { return (self.contentOffset.y + self.frame.size.height) >= self.contentSize.height }
   /**
    * Returns the next pagination range according to index and max possible items
    */
   public var paginationRange: PaginationRange {
      let from: Int = Swift.min(paginationIndex, self.getTotalItemsCount()) // Ensures that start is never more than end
      let to: Int = Swift.min(paginationIndex + Self.paginationAmount, self.getTotalItemsCount()) // Ensures that end is never more than available .count of datasource
      return (from, to)
   }
}
