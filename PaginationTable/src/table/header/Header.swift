import UIKit
import With
import Spatial

final class Header: UITableViewHeaderFooterView {
   static let height: CGFloat = 260
   override var frame: CGRect { get { return super.frame } set { if newValue.width == 0 { return }; super.frame = newValue } } // Fix for Autolayout bug. See: https://stackoverflow.com/a/50660933
   lazy var background = createBackground() // we can't set a color to A headerView so we have to add a view to accomplish it
   static let reuseIdentifier: String = .init(describing: Header.self)
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
extension Header {
   /**
    * Background
    */
   func createBackground() -> UIView {
      return with (.init()) {
         contentView.addSubview($0)
         $0.backgroundColor = .blue
         $0.anchorAndSize(to: self) // $0.anchorAndSize(to: contentView, align: .topLeft, alignTo: .topLeft, offset: .init(x: 24, y: 24), sizeOffset: .init(width: -48, height: -48))//(to: self, width: size.width, align: .centerLeft, alignTo: .centerLeft, offset: .init(x: 20, y: 0) )
      }
   }
}
