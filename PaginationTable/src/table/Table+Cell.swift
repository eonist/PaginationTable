import UIKit
/**
 * Cell
 */
extension Table {
   /**
    * Returns row count in a section
    */
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return rowData.count
   }
   /**
    * Creates / Recycles cells
    */
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell: TextCell = tableView.dequeueReusableCell(withIdentifier: "\(TextCell.self)", for: indexPath as IndexPath) as? TextCell else { fatalError("err") }
      let data = rowData[indexPath.row]
      cell.data = TextCellData(description: data.artistName, content: data.songTitle)
      cell.backgroundColor = .clear // debug
      return cell as TextCell
   }
   /**
    * Returns the height of each cell
    */
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 32
   }
   /**
    * Register cells
    */
   func registerCells() {
      self.register(TextCell.self, forCellReuseIdentifier: "\(TextCell.self)")
   }
   /**
    * When an item is tapped
    */
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      Swift.print("tapped")
   }
}
