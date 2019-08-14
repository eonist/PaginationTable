### PaginationTable.swift:

```swift
class PaginationTable {
  typealias ArtistAndSong = (_ artist: String, _ song: String)
  var _rowData: [ArtistAndSong] = [] // load from file in .assets, see earlier implementation for this caching thing
  var rowData: [ArtistAndSong] = []
  static let paginationAmount: Int = 30
  var paginationIndex: Int = paginationAmount
  var isFetching: Bool = false
  init(rowData: [ArtistAndSong]) {
    self.rowData = rowData
  }
   /**
    * - Abstract: When the table has stopped deceleration after swipe-up
    */
  func onScrollDecelerationEnded() {
    guard isOnBottom && !isFetching else { return } // must have reached the absolute bottom and must not be already fetching
    PaginationTable.fetchData(range: (paginationIndex, paginationIndex + PaginationTable.paginationAmount)) {
      Dispatch.main.async { [weak self] in
        self?.rowData += newData
        self?.reloadTable()
        self?.paginationIndex = PaginationTable.paginationAmount // set the new pagination index
      }
    }
  }
  func cellForRow(i: Int) -> UITableCell {
    let cell = TextCell.init()
    cell.text = rowData[i].artist + " " +  rowData[i].song
    return cell
  }
}
 /**
  * Data
  */
extension PaginationTable {
  typealias RequestComplete = (_ artistAndSong: [ArtistAndSong]) -> Void
  /*
    *
    */
  static func fetchData(range: (from: Int, to: Int), complete: RequestComplete) -> [ArtistAndSong] {
    Dispatch.background.async {
      sleep((1..<7).randomElement) // simulates network call taking between 1 and 7 seconds
      let newData = _rowData[from..<to]
      complete(newData)
    }
  }
}
```
### View.swift

```swift
func createTable() -> PaginationTable {
  let table = .init(rowData: [])
  addSubview(table)
  PaginationTable.fetchData(range: (0, PaginationTable.paginationAmount)) {
    Dispatch.main.async { [weak table] in
      table?.rowData += newData
      table?.reloadTable()
      table?.paginationIndex = PaginationTable.paginationAmount // set the new pagination index
    }
  }
  return table
}
```
