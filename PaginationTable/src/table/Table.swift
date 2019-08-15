import UIKit
import With
import Spatial

class Table: UITableView, UITableViewDelegate, UITableViewDataSource {
   var rowData: [ArtistAndSong] = [] // Used in combination with rowData
   var paginationIndex: Int = paginationAmount // The current amount of cells (this grows as you load more data
   var isFetching: Bool = false // A boolean that lets the code know if data is already loading or not, to avoid double fetching etc
   /**
    * Init
    */
   init(rowData: [ArtistAndSong], frame: CGRect, style: UITableView.Style) {
      super.init(frame: frame, style: style)
      self.backgroundColor = .lightGray
      registerCells() // Registers Cell types
      self.separatorStyle = .none
      // Delegate
      self.dataSource = self
      self.delegate = self
      // UI
      self.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
      self.scrollIndicatorInsets = self.contentInset
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
