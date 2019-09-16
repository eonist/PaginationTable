![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
![platform](https://img.shields.io/badge/Platform-iOS-blue.svg)
![platform](https://img.shields.io/badge/Platform-macOS-blue.svg)
![Lang](https://img.shields.io/badge/Language-Swift%205.1-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)
[![codebeat badge](https://codebeat.co/badges/deb313b8-68c2-4e79-8bed-dfcdfb79416f)](https://codebeat.co/projects/github-com-eonist-paginationservice-master)

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
