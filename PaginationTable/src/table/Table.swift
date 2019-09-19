import UIKit
import With
import Spatial

class Table: UITableView, UITableViewDelegate, UITableViewDataSource {
   var rowData: [ArtistAndSong] = [] // Used in combination with rowData
   var paginationIndex: Int = 0 // The current amount of cells (this grows as you load more data
   var isFetching: Bool = false // A boolean that lets the code know if data is already loading or not, to avoid double fetching etc
   /**
    * Initiate
    */
   init(rowData: [ArtistAndSong], frame: CGRect, style: UITableView.Style) {
      super.init(frame: frame, style: style)
      self.backgroundColor = .lightGray
      registerUI() // Registers Cell types
      self.separatorStyle = .none
      // Delegate
      self.dataSource = self
      self.delegate = self
      // UI
      self.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
      self.scrollIndicatorInsets = self.contentInset
      // Add Sections (Header / Footer)
      self.tableHeaderView = createHeader()
      self.tableFooterView = createFooter()
      self.tableFooterView?.isHidden = true
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
