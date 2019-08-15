import Foundation
/**
 * String
 */
extension NetworkParser {
   /**
    * Return string for WebPath
    * - Remark: should be added to a bg thread
    * - Remark: For multiple varaiables etc: param1=value1&param2=value2
    * ## Examples:
    * NetworkParser.str(webPath: webPath) // (See defaultDownloadComplete)
    * urlStr: "https://www.google.com/dev/push?=someValue"
    */
   public static func str(urlStr: String, httpMethod: HTTPMethodType = .get, onComplete:@escaping DownloadComplete = defaultDownloadComplete) {
      guard let url = URL(string: urlStr) else { onComplete(nil, .invalideWebPath); return }
      str(url: url, httpMethod: httpMethod, downloadComplete: onComplete)
   }
   /**
    * Return string for URL
    * ## Examples:
    * NetworkParser.str(url: url)
    */
   public static func str(url: URL, httpMethod: HTTPMethodType = .get, downloadComplete:@escaping DownloadComplete = defaultDownloadComplete) {
      data(url: url, httpMethod: httpMethod) { data, response, error in
         guard let data = data, error == nil else { downloadComplete(nil, .errorGettingDataFromURL(error, response)); return }
         //Swift.print(response?.suggestedFilename ?? url.lastPathComponent)
         guard let stringValue = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? else { downloadComplete(nil, .dataIsNotString); return }
         downloadComplete(stringValue, nil)
      }
   }
}
