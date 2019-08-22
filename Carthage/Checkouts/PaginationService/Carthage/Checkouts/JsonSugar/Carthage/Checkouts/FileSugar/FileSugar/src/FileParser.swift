import Foundation

public class FileParser {
   /**
    * Returns string content from a file at file location "path"
    * - PARAM: path is the file path to the file in this format: (User/John/Desktop/test.txt)
    * - IMPORTANT: ⚠️️ Remember to expand the path with the .tildePath call, if it's a tilde path
    * NOTE: Supports syntax like this: /Users/John/Desktop/temp/../test.txt (the temp folder is excluded in this case)
    * let path = "//Users/<path>/someFile.xml"
    * var err: NSError?
    * let content = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: &err)
    * ## EXAMPLE: FileParser.content("~/Desktop/temp.txt".tildePath)//
    */
   public static func content(_ path: String) -> String? {
      do {
         let content: String = try String(contentsOfFile: path, encoding: .utf8)
         return content
      } catch {
         return nil
      }
   }
   /**
    * FileParser.resourceContent("example","txt")
    * ## Examples:
    * Swift.print(FileParser.content(FilePathParser.resourcePath() + "/temp.bundle/test.txt"))
    */
   public static func resourceContent(_ fileName: String, fileExtension: String) -> String? {
      if let filepath: String = Bundle.main.path(forResource: fileName, ofType: fileExtension ) {
         return content(filepath)
      } else {
         return nil // example.txt not found!
      }
   }
   /**
    * NOTE: make sure the file exists with: FileAsserter.exists("some path here")
    * PARAM: Can't be tildePath, must be absolute Users/John/...
    */
   public static func modificationDate(_ filePath: String) -> NSDate? {
      let fileURL: NSURL = .init(fileURLWithPath: filePath)
      guard let attributes = try? fileURL.resourceValues(forKeys: [URLResourceKey.contentModificationDateKey, URLResourceKey.nameKey]) else { return nil }
      guard let modificationDate: NSDate = attributes[URLResourceKey.contentModificationDateKey] as? NSDate else { return nil }
      return modificationDate
   }
   /**
    * Returns paths of content in a dir
    * NOTE: This is the root folder of the main Harddrive on your computer
    */
   public static func contentOfDir(_ path: String) -> [String]? {
      let fileManager = FileManager.default
      do {
         let files = try fileManager.contentsOfDirectory(atPath: path)
         return files
      }catch let error as NSError {
         print("Error: \(error)")
         return nil
      }
   }
   /**
    * Returns temporary directory path
    */
   public static var tempPath: String {
      let path = NSTemporaryDirectory() as String
      return path
   }
   /**
    * Returns the current directory path
    */
   public static var curDir: String {
      let fileManager = FileManager.default
      let path = fileManager.currentDirectoryPath
      return path
   }
}

#if os(OSX)
import Cocoa

extension FileParser {
   /**
    * Returns an xml instance comprised of the string content at location PARAM: path
    * EXAMPLE: xml("~/Desktop/assets/xml/table.xml".tildePath)//Output: XML instance
    * IMPORTANT: ⚠️️ Remember to expand the "path" with the tildePath call before you call xml(path)
    */
   public static func xml(_ path: String) -> XMLElement? {
      guard let content: String = FileParser.content(path) else { fatalError("Must have content: path: \(path)") }
      do {
         let xmlDoc: XMLDocument = try XMLDoc(xmlString: content, options: XMLNode.Options(rawValue: 0))
         if let rootElement: XMLElement = xmlDoc.rootElement() {
            return rootElement
         }else {
            return nil
         }
      }catch let error as NSError {
         print ("Error: \(error.domain) path:\(path)")
         return nil
      }
   }
   /**
    * NOTE: you have an extension for NSSavePanel in WinExtension: See NSSavePanel.initialize....
    */
   private static func modalExample() {
      let myFileDialog: NSOpenPanel = .init()/*open modal panel*/
      myFileDialog.runModal()
      let thePath = myFileDialog.url?.path/*Get the path to the file chosen in the NSOpenPanel*/
      if let thePath = thePath {/*Make sure that a path was chosen*/
         if let theContent = FileParser.content(thePath) {
            Swift.print("theContent: " + "\(theContent)")
         }
      }
   }
}
#endif
