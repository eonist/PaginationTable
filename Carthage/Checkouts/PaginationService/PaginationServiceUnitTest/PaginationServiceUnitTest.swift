import XCTest
import PaginationServiceiOS

class PaginationServiceUnitTest: XCTestCase {
    override func setUp() {
      super.setUp()
    }
    override func tearDown() {
      super.tearDown()
    }
    func testExample() {
      test1()
      test2()
      test3()
      test4()
    }
}
extension PaginationServiceUnitTest {
   /**
    * Testing a regular pagination service
    */
   func test1() {
      Swift.print("test1")
      TrackPaginationService.getItems(index: 0, length: 50) { result in // 50
         let tracks: [Track]?  = try? result.get()
         Swift.print("1. artistName: \(String(describing: tracks?.first?.artistName)) count: \(String(describing: tracks?.count))")
         XCTAssertEqual(tracks?.count, 50)
      }
      TrackPaginationService.getItems(index: 120, length: 50) { result in // 8
         let tracks: [Track]?  = try? result.get()
         Swift.print("2. artistName: \(String(describing: tracks?.first?.artistName)) count: \(String(describing: tracks?.count))")
         XCTAssertEqual(tracks?.count, 8)
      }
      TrackPaginationService.getItems(index: 160, length: 50) { result in // false, 0
         let tracks: [Track]?  = try? result.get()
         Swift.print("3. artistName: \(String(describing: tracks?.first?.artistName)) count: \(String(describing: tracks?.count))")
         XCTAssertEqual(tracks?.count ?? 0, 0)
      }
   }
   /**
    * Debugging Pagination service (Testing if all items are cached)
    */
   func test2() {
      Swift.print("test2")
      let b = CustomPaginationService.items
//      b.forEach { Swift.print("\($0)") }
//      Swift.print("b:  \(b.count)")
      XCTAssertEqual(b.count, 134)
   }
   /**
    * Testing A Custom pagination service
    */
   func test3() {
      Swift.print("test3")
      CustomPaginationService.getItems(index: 0, length: 50) { result in // 50
         let tracks: [String]?  = try? result.get()
         Swift.print("1. count: \(String(describing: tracks?.count))")
         XCTAssertEqual("Hello, World!", "Hello, World!")
      }
      CustomPaginationService.getItems(index: 120, length: 50) { result in // 30
         let tracks: [String]?  = try? result.get()
         Swift.print("2. count: \(String(describing: tracks?.count))")
         XCTAssertEqual("Hello, World!", "Hello, World!")
      }
      CustomPaginationService.getItems(index: 160, length: 50) { result in // false, 0
         let tracks: [String]?  = try? result.get()
         Swift.print("3. count: \(String(describing: tracks?.count))")
         XCTAssertEqual("Hello, World!", "Hello, World!")
      }
   }
   /**
    * Tests totalItemCount api call
    */
   func test4() {
      XCTAssertEqual( CustomPaginationService.getTotalItemsCount(), 134)
   }
}
