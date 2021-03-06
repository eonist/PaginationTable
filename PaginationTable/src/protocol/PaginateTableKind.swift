import UIKit

public protocol PaginateTableKind: AnyObject {
   /**
    * The current amount of cells (this grows as you load more data
    * - Note: this changes as more items are loaded, start with 0
    */
   var paginationIndex: Int { get }
   /**
    * A boolean that let's the code know if data is already loading or not, to avoid double fetching etc
    * - Note: Should be false at initiation
    */
   var isFetching: Bool { get set }
   /**
    * The amount to fetch on each pagination cycle
    * - Note: Set this to something like: 25, 50 etc
    */
   static var paginationAmount: Int { get }
   /**
    * Returns the total amount of items existing
    * - Note: Connect this variable to your backend
    */
   func getTotalItemsCount() -> Int
   /**
    * - Abstract: Universal method for scrolling motion complete
    * - Note: call this method from: scrollViewDidEndDragging() and scrollViewDidEndDecelerating()
    */
   func scrollingEnded()
}
