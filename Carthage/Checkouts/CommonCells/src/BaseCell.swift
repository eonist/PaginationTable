import UIKit

open class BaseCell: UITableViewCell {
    open var data: CellDataKind? // Stores cellData
    /**
     * Init
     */
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none // disables the selection highlighting
    }
    /**
     * Boilerplate
     */
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
