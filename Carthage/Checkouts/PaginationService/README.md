# PaginationService

<img width="240" alt="img" src="pagination.gif?raw=true">

### What is it
- A framework for mocking paginated calls.

### requirements:
- Decodable struct
- .json file
- A subclass with Type and path to json file

### How do I get it
- Carthage `github "eonist/PaginationService"`
- Manual Open `.xcodeproj`

### Example:
**JSON**
```json
["Sublime", "Dave Matthews", "Tom Petty"]
```
**Swift**
```swift
public class CustomPaginationService: PaginationService<String> {
   override open class var filePath: String { return Bundle.main.resourcePath! + "/assets.bundle/items.json" }
   private static var __items: [String]?
   override public class var _items: [String]? {
      get { return __items }
      set { __items = newValue }
   }
}
CustomPaginationService.getItems(index: 20, length: 50) { success, items in Swift.print("success: \(success) \(items.count)") } // 30
```
