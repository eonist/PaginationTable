import UIKit
///
/// Create
///
extension TextCell {
    ///
    /// Create Title Label
    ///
    @objc func createDescriptionLabel() -> UILabel {
        let label: UILabel = .init()
        label.text = "title"
        label.textColor = .white//.black
        label.backgroundColor = .clear
        label.font = .boldSystemFont(ofSize: 16) // .boldSystemFont(ofSize: 20.0)
        label.textAlignment = .left
        self.addSubview(label)
        // Constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        let left = label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Margin.horizontal)
        let y = label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        NSLayoutConstraint.activate([left, y])
        label.setContentHuggingPriority(.init(500), for: .horizontal) // Makes sure the label retians it's instrinsic width, as oppose to sticking to the textField left anchor
        return label
    }
    ///
    /// Create Content TextField
    ///
    @objc func createContentTextField() -> UITextField {
        let tf: UITextField = .init()
        tf.isUserInteractionEnabled = false
        tf.textAlignment = .right
        tf.textColor = .gray
        tf.tintColor = #colorLiteral(red: 0, green: 1, blue: 1, alpha: 1)//.cyan
        tf.font = .systemFont(ofSize: 16)
        self.addSubview(tf)
        // Constraints
        configContentTextFieldConstraints(tf)
        return tf
    }
}
///
/// Constraints
///
extension TextCell {
    ///
    /// - Description: Configure contentTextField constraints
    ///
    @objc func configContentTextFieldConstraints(_ tf: UITextField) {
        tf.translatesAutoresizingMaskIntoConstraints = false
        let y = tf.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let left = tf.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: Margin.horizontal)
        left.priority = .init(rawValue: 251)
        let right = tf.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Margin.horizontal)
        NSLayoutConstraint.activate([left, right, y])
        tf.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 250), for: .horizontal) // Makes sure the content doesnt overlap the label
    }
}
