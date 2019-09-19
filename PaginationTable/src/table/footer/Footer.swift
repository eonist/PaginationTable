import UIKit
import With
import Spatial

final class Footer: UITableViewHeaderFooterView {
   static var height: CGFloat = 120
   static let reuseIdentifier: String = .init(describing: Footer.self)
   override var frame: CGRect { get { return super.frame } set { if newValue.width == 0 { return }; super.frame = newValue } } // Fix for Autolayout bug. See: https://stackoverflow.com/a/50660933
   lazy var background = createBackground() // We can't set a color to A footerView so we have to add a view to accomplish it
   override init(reuseIdentifier: String?) {
      super.init(reuseIdentifier: reuseIdentifier)
      _ = background
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
   }
}
/**
 * Create
 */
extension Footer {
   /**
    * Background
    */
   func createBackground() -> UIView {
      return with (.init()) {
         addSubview($0)
         $0.backgroundColor = .green
         $0.anchorAndSize(to: self)
      }
   }
}
