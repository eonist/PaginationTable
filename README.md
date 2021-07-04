![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
![platform](https://img.shields.io/badge/Platform-iOS-blue.svg)
![Lang](https://img.shields.io/badge/Language-Swift%205.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)

# PaginationTable
Example of how pagination in a table works

<img width="240" alt="img" src="https://github.com/stylekit/img/blob/master/pagination.gif?raw=true">

### Core components:
- rowData: This array will grow on each scroll-ended-event until it has loaded all items from backend-API
- paginationAmount: The amount to fetch on each pagination cycle
- paginationIndex: The current amount of cells (this grows as you load more data
- isFetching: A boolean that lets the code know if data is already loading or not, to avoid double fetching etc
- fetchData: Simulates getting data from remote-api

## Gotchas:
- The example code is not reliant on a backend. It simply tests with data from a file and simulates network calls by sleeping for some seconds
- The example uses some dependencies in order to speed up the creation of this example. But its basic stuff like AFNetwork, Json parsing, Autollayout. All of which could easily be substituted

### Requirements:
- Backend-API that can provide the count of items
- Backend-API that can return items for a range (startIndex, endIndex)

### Todo:
- add spm
- add github actions
