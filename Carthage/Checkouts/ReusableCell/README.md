[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)

# ReusableCell
- Makes dequeuing cells simpler
- Supports UITableView and UICollectionView
- Supports UITableViewCell and UICollectionViewCell

### Example:

```swift
import ReusableCell_iOS
tableView.register(CustomCell.self) // Register Cells with ease
extension CustomCell: ReusableCell {} // Make your custom cells
let cell: CustomCell = tableView.dequeueReusableCell(for: indexPath) // Instantiate your cells
// In the cell:
extension CustomCell: ReusableCellKind { // make your subclass conform to the protocol
  open class var defaultReuseIdentifier: String { return "\(TextCell.self)" }
}
```

### Install:
- Carthage: `github "eonist/ReusableCell" "master"`
- Manual: Open `ReusableCellExample.xcodeproj`
- CocoaPod (Coming soon)  
