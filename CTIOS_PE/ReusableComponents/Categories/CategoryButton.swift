import UIKit

class CategoryButton: UIControl {

    private let bgCircle = UIView()
    private let iconView = UIImageView()
    private let titleLabel = UILabel()

    private var item: CategoryItem!

    private var isConfigured = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        applyTheme()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        applyTheme()
    }

    // MARK: - UI Setup
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false

        // Circle container
        bgCircle.translatesAutoresizingMaskIntoConstraints = false
        bgCircle.clipsToBounds = false
        bgCircle.layer.masksToBounds = false

        // Icon
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit

        bgCircle.addSubview(iconView)

        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: bgCircle.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: bgCircle.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 28),
            iconView.heightAnchor.constraint(equalToConstant: 28)
        ])

        // Title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center

        // Stack
        let vStack = UIStackView(arrangedSubviews: [bgCircle, titleLabel])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.spacing = 8
        vStack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(vStack)

        NSLayoutConstraint.activate([
            bgCircle.widthAnchor.constraint(equalToConstant: 70),
            bgCircle.heightAnchor.constraint(equalToConstant: 70),

            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        // Enable touch feedback
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUp), for: [.touchCancel, .touchUpInside, .touchDragExit])
    }

    // MARK: - THEME APPLYING
    func applyTheme() {
        let theme = AppTheme.shared.current

        // Background circle
        bgCircle.layer.cornerRadius = 35
        bgCircle.backgroundColor = theme.cardBackground

        // Shadow (light mode only)
        bgCircle.layer.shadowColor = UIColor.black.cgColor
        bgCircle.layer.shadowOpacity = theme.shadowOpacity
        bgCircle.layer.shadowOffset = CGSize(width: 0, height: 3)
        bgCircle.layer.shadowRadius = theme.shadowRadius

        // Icon color
        iconView.tintColor = theme.primary

        // Title font & color
        titleLabel.font = theme.bodyFont
        titleLabel.textColor = theme.textPrimary
    }

    // Update on mode change
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme()
    }

    // MARK: - Configure
    func configure(with item: CategoryItem) {
        self.item = item
        iconView.image = UIImage(named: item.imageName)?.withRenderingMode(.alwaysTemplate)
        titleLabel.text = item.title

        applyTheme()
    }

    // MARK: - Touch animation
    @objc private func touchDown() {
        UIView.animate(withDuration: 0.1) {
            self.bgCircle.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
            self.alpha = 0.85
        }
    }

    @objc private func touchUp() {
        UIView.animate(withDuration: 0.12) {
            self.bgCircle.transform = .identity
            self.alpha = 1
        }
    }
}
