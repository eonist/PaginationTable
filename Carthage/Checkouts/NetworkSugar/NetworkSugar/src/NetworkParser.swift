#if os(OSX)
import AppKit.NSView
#else
import UIKit.UIView
#endif
/**
 * Data
 */
public class NetworkParser {
   /**
    * ## Examples:
    * NetworkParser.data(webPath: webPath)
    */
   public static func data(urlStr: String, onComplete:@escaping DataDownloadComplete = defaultDataComplete) {
      guard let url = URL(string: urlStr) else { onComplete(nil, .invalideWebPath); return }
      data(url: url) { data, response, error in
         guard let data = data, error == nil else { onComplete(nil, .errorGettingDataFromURL(error, response)); return }
         //Swift.print(response?.suggestedFilename ?? url.lastPathComponent)
         onComplete(data, nil)
      }
   }
   /**
    * Get Data from URL
    * ## Examples:
    * NetworkParser.data(url: url)
    * - Note: this onliner also works: URLSession.shared.dataTask(with: url) { data, response, error in completion(data, response, error) }.resume()
    * - Note: For multiple varaiables etc: param1=value1&param2=value2
    * - Note: urlStr:"https://www.google.com/dev/push?tx=someValue"
    * - Parameter httpBody: some servers requires the params to be encoded as data
    */
   public static func data(url: URL, httpMethod: HTTPMethodType = .get, httpBody: Data? = nil, completion: @escaping URLQuery = defaultURLQueryComplete) {
      var urlRequest: URLRequest = .init(url: url)
      urlRequest.httpMethod = httpMethod.rawValue//get or post
      if let httpBody = httpBody {
         urlRequest.httpBody = httpBody
      }
      data(urlRequest: urlRequest, completion: completion)
   }
   /**
    * - Note: Used for Custom URLRequests
    */
   public static func data(urlRequest: URLRequest, completion: @escaping URLQuery = defaultURLQueryComplete) {
      let session: URLSession = .shared
      let task: URLSessionTask = session.dataTask(with: urlRequest as URLRequest) { data, response, error in
         completion(data, response, error)
      }
      task.resume()
   }
}
