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
      let cell: UITableViewCell = {
         guard let cell: TextCell = tableView.dequeueReusableCell(withIdentifier: "\(TextCell.self)", for: indexPath as IndexPath) as? TextCell else {fatalError("err")}
//         cell.textLabel?.text = rowData[indexPath.row]
         let data = rowData[indexPath.row]
         cell.data = TextCellData.init(description: data.artistName, content: data.songTitle)
         cell.backgroundColor = .clear // debug
         return cell as TextCell
      }()
      return cell
   }
   /**
    * Returns the height of each cell
    */
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      switch indexPath.row {
      case 0: return 32
      default: return 32
      }
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
//      let id = rowData[indexPath.row]
//      _ = id
      Swift.print("tapped")
//      self.contentOffset.y += 32
//      let vc = TertiaryDetailVC.init(id: id)
//      self.navigationController()?.pushViewController(vc, animated: true) // present(navController, animated: true, completion: {Swift.print("completed the transition")})
   }
//   tableheader
}

