import UIKit
///
/// Constants
///
extension TextCell {
    static let backgroundColor: UIColor = .blue
    static let cellHeight: CGFloat = 124
    class var cellReuseIdendifier: String { return "\(TextCell.self)" }
    enum Margin {
        static let horizontal: CGFloat = 12
        static let horizontalSpaceBetween: CGFloat = 4
        static let vertical: CGFloat = 12
        static let verticalSpaceBetween: CGFloat = 4
    }
}
