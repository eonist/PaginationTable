import Foundation
/**
 * Default callbacks
 */
extension NetworkParser {
   /**
    * Default completetion block for download
    */
   public static var defaultDownloadComplete: DownloadComplete = { (string: String?, error: DownloadError?) in
      if let str = string {
         Swift.print("str:  \(str)")
      } else {
         Swift.print("error:  \(String(describing: error))")
      }
   }
   /**
    * Default callback method for data(url: URL)
    */
   public static var defaultURLQueryComplete: URLQuery = { (data: Data?, response: URLResponse?, error: Error?) in
      if let data = data, let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
         Swift.print("str:  \(str)")
      } else {
         Swift.print("error:  \(String(describing: error)) response: \(String(describing: response))")
      }
   }
   /**
    * Default callback method for data(webPath:String) call
    */
   public static var defaultDataComplete: DataDownloadComplete = { (data: Data?, error: DownloadError?) in
      if let data = data, let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
         Swift.print("str:  \(str)")
      } else {
         Swift.print("error:  \(String(describing: error))")
      }
   }
}
