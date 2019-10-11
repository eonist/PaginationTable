import UIKit
import PaginationServiceiOS

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
    * - Note: Must be called from (scrollViewDidEndDragging and scrollViewDidEndDecelerating)
    * 1. Assert if you are at the bottom
    * 2. get items from remote service
    * 3. populate rowData
    * 4. reveal footer if you are at the bottom
    */
   func scrollingEnded() {
      guard isBottom && !isFetching else { Swift.print("Already fetching"); return } // Must have reached the absolute bottom and must not be already fetching
      isFetching = true
      TrackPaginationService.getItems(index: paginationRange.from, length: paginationRange.to - paginationRange.from) { result in
         DispatchQueue.main.async { [weak self] in
            guard let tracks: [Track] = try? result.get() else { return }
            Swift.print("ArtistName: \(String(describing: tracks.first?.artistName)) count: \(tracks.count)")
            self?.rowData += tracks
            self?.paginationIndex += Table.paginationAmount // Set the new pagination index
            self?.reloadData() // Fixme: ⚠️️ possibly move this bellow
            self?.isFetching = false
            if self?.rowData.count == self?.getTotalItemsCount() { // only needed if you need the footer at the bottom
               Swift.print("At the bottom, reveal footer ✅")
               self?.tableFooterView?.isHidden = false
               self?.tableFooterView?.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Footer.height)
               self?.reloadData() // This call is needed or else the footerView.frame.height isnt accounted for
            }
            Swift.print("Reload table complete (scrollEnded)")
         }
      }
   }
}
