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
    var paginationIndex: Int { return self.rowData.count } // The current amount of cells (this grows as you load more data
}
