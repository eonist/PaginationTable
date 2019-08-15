import Foundation

/**
 * Data
 */
extension Table {
   typealias RequestComplete = (_ artistAndSong: [ArtistAndSong]) -> Void
   /**
    * 
    */
   static func fetchData(range: PaginationRange, complete: @escaping RequestComplete) {
      DispatchQueue.global(qos: .background).async {
         let sleepDur: UInt32 = (1..<4).randomElement()!
         Swift.print("sleepDur:  \(sleepDur)")
         sleep(sleepDur) // Simulates network call taking between 1 and 7 seconds
         Swift.print("range:  \(range)")
         Swift.print("Table._rowData.count:  \(Table._rowData.count)")
         let newData = Array(Table._rowData[range.from..<range.to])
         complete(newData)
      }
   }
}
