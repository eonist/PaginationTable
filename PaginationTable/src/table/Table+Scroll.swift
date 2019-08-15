import UIKit

extension Table {
   /**
    * - Abstract: When the table has stopped dragging
    */
   func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
      scrollingEnded()
   }
   /**
    * - Abstract: When the table has stopped it's motion
    */
   func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
      scrollingEnded()
   }
   /**
    * - Abstract: Universal method for scrolling motion complete
    */
   private func scrollingEnded() {
      guard isBottom && !isFetching else { Swift.print("not at the bottom or already fetching 🤷"); return } // must have reached the absolute bottom and must not be already fetching
      isFetching = true
      Table.fetchData(range: paginationRange) { artistAndSong in
         DispatchQueue.main.async { [weak self] in
            self?.rowData += artistAndSong
            self?.paginationIndex += Table.paginationAmount // set the new pagination index
            self?.reloadData()
            self?.isFetching = false
            Swift.print("reload table complete (scroll)")
         }
      }
   }
}
