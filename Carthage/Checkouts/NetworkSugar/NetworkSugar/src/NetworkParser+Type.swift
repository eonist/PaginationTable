import Foundation
/**
 * Type
 */
extension NetworkParser {
   public typealias DownloadComplete = (String?, DownloadError?) -> Void
   public typealias DataDownloadComplete = (Data?, DownloadError?) -> Void
   public typealias URLQuery = (Data?, URLResponse?, Error?) -> Void
}
