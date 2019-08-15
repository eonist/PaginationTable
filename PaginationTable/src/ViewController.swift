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
      Table.fetchData(range: table.paginationRange) { artistAndSong in
         DispatchQueue.main.async { [weak table] in
            table?.rowData += artistAndSong
            table?.reloadData()
            table?.paginationIndex += Table.paginationAmount // set the new pagination index
            table?.isFetching = false
            Swift.print("reload table complete (init)")
         }
      }
   }
}
