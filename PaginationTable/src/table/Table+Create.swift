import UIKit
import With
/**
 * Create
 */
extension Table {
   /**
    * Header
    */
   func createHeader() -> Header? {
      return with(self.dequeueReusableHeaderFooterView(withIdentifier: Header.reuseIdentifier) as? Header) {
         $0?.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Header.height)
      }
   }
   /**
    * Footer
    */
   func createFooter() -> Footer? {
      return with(self.dequeueReusableHeaderFooterView(withIdentifier: Footer.reuseIdentifier) as? Footer) {
         // - Fixme: ⚠️️ the footer should only be hidden if table has more than pagination.max
         $0?.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0/*Footer.height*/)
         $0?.isHidden = true
      }
   }
}
