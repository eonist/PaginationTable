import UIKit
///
/// - Abstract: Provides a way to show a DescriptionLabel and and InputTextField in a TableCell
/// - Remark: Left-aligned Label and Right-Aligned content TextField
///
class TextCell: BaseCell {
    lazy var descriptionLabel: UILabel = createDescriptionLabel()
    lazy var contentTextField: UITextField = createContentTextField()
    ///
    /// - Abstract: When you set the data, the diferent UI's will be updated
    ///
    override var data: CellDataKind? {
        didSet {
            guard let data: TextCellData = data as? TextCellData else { return }
            descriptionLabel.text = data.description
            contentTextField.text = data.content
        }
    }
}
