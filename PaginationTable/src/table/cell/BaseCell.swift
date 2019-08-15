import UIKit

class BaseCell: UITableViewCell {
    var data: CellDataKind? // Stores cellData
    /**
     * Init
     */
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none // disables the selection highlighting
    }
    /**
     * Boilerplate
     */
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
