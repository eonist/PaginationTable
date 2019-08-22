import Foundation
/**
 * Data
 */
extension Table {
   typealias RequestComplete = (_ artistAndSong: [ArtistAndSong]) -> Void
   /**
    * Simulates getting data from remote-api
    */
   static func fetchData(range: PaginationRange, complete: @escaping RequestComplete) {
      DispatchQueue.global(qos: .background).async {
         let sleepDur: UInt32 = (1..<4).randomElement()!
         sleep(sleepDur) // Simulates network call taking between 1 and 7 seconds
         let newData = Array(Table._rowData[range.from..<range.to])
         complete(newData)
      }
   }
}
