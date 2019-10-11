import UIKit

class ViewController: UIViewController {
   override var prefersStatusBarHidden: Bool { return true }
   /**
    * Set title
    * - Note: I guess this must be set from this method in order for it to work
    */
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      let title = "Title"
      navigationItem.title = title
   }
   override func viewDidLoad() {
      super.viewDidLoad()
      let table = Table(rowData: [], frame: .zero, style: .plain)
      view = table
      table.isFetching = true
      let range = (index: table.paginationRange.from, length: table.paginationRange.to - table.paginationRange.from)
      TrackPaginationService.getItems(index: range.index, length: range.length) { result in
         DispatchQueue.main.async { [weak table] in
            guard let tracks: [Track] = try? result.get() else { return }
            Swift.print("ArtistName: \(String(describing: tracks.first?.artistName)) count: \(tracks.count)")
            table?.rowData += tracks
            table?.reloadData()
            table?.isFetching = false
            Swift.print("Reload table complete (scroll)")
         }
      }
   }
}
