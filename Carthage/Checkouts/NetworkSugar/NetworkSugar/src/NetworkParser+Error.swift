import Foundation
/**
 * Extra
 */
extension NetworkParser {
   public enum HTTPMethodType: String { case get = "GET"; case post = "POST" }
   public enum DownloadError: Error {
      case invalideWebPath
      case dataIsNotString
      case errorGettingDataFromURL(Error?, URLResponse?)
   }
}
