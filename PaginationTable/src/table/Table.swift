import UIKit
import With
import Spatial

class Table: UITableView, UITableViewDelegate, UITableViewDataSource {
   var rowData: [ArtistAndSong] = [] // Used in combination with rowData
   static var _rowData: [ArtistAndSong] = Table.playlist // Main source of data
   static let paginationAmount: Int = 25
   var paginationIndex: Int = paginationAmount
   var isFetching: Bool = false
   /**
    * Init
    */
   init(rowData: [ArtistAndSong], frame: CGRect, style: UITableView.Style) {
//      self.rowData = rowData
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
