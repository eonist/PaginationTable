import UIKit

extension Table {
   private static let headerHeight: CGFloat = 260
   private static let footerHeight: CGFloat = 160
   /**
    * Represents the height of the table-header
    */
   override var sectionHeaderHeight: CGFloat { get { return Table.headerHeight } set { super.sectionHeaderHeight = newValue } }
   override var estimatedSectionHeaderHeight: CGFloat { get { return Table.headerHeight } set { super.estimatedSectionHeaderHeight = newValue } }
   /**
    * Represents the height of the table-footer
    */
   override var sectionFooterHeight: CGFloat { get { return Table.footerHeight } set { super.sectionFooterHeight = newValue } }
   override var estimatedSectionFooterHeight: CGFloat { get { return Table.footerHeight } set { super.estimatedSectionFooterHeight = newValue } }
}
