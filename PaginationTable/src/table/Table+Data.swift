import Foundation
import JSONSugar
import NetworkSugar
/**
 * File
 */
extension Table {
   static let _rowData: [ArtistAndSong] = Table.playlist // Main source of data
   /*
    * Returns playlist array for json file
    * - Abstract: gets json from local file and converts it into an array
    */
   static var playlist: [ArtistAndSong] {
      let filePath = Bundle.main.resourcePath! + "/assets.bundle/artistandsongs.json"
      guard let jsonStr: String = try? String(contentsOfFile: filePath, encoding: .utf8) as String else { return [] }
      return playlist(str: jsonStr)
   }
}
/**
 * Data
 */
extension Table {
   /**
    * Returns playlist data for json string
    */
   private static func playlist(str: String) -> [ArtistAndSong] {
      guard let jsonData = str.data(using: .utf8) else { fatalError("Unable to convert string to data") }
      do {
         guard let playlistCellData: [ArtistAndSong] = try decode(data: jsonData) else { print("Unable to decode"); return [] }//From json to struct {
         //playlistCellData.forEach { Swift.print("$0.artistName:  \($0.artistName) $0.songTitle:  \($0.songTitle)") }
         return playlistCellData // return result
      } catch let jsonErr {
         print("Error serializing json", jsonErr)
         return [] // return empty array
      }
   }
}
