import UIKit

extension Table {
   /**
    * scrollViewDidEndDragging
    * - Abstract: When the table has stopped dragging
    */
   func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
      guard isBottom && !isFetching else { Swift.print("already fetching 🤷"); return } // must have reached the absolute bottom and must not be already fetching
//      Swift.print("scrollViewDidEndDragging isBottom: \(isBottom)")
      isFetching = true
      Table.fetchData(range: paginationRange) { artistAndSong in
         DispatchQueue.main.async { [weak self] in
            self?.rowData += artistAndSong
            self?.paginationIndex += Table.paginationAmount // set the new pagination index
            self?.reloadData()
            self?.isFetching = false
            Swift.print("reload table complete")
         }
      }
   }
}
