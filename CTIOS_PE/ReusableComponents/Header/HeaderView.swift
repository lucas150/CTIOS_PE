import UIKit

final class HeaderView: UIView {

    // MARK: - UI Elements
    private let gradientLayer = CAGradientLayer()
    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()

    // MARK: - Custom Properties
    var titleText: String = "" {
        didSet { titleLabel.text = titleText }
    }

    var logo: UIImage? {
        didSet { logoImageView.image = logo }
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        applyDefaultThemeAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        applyDefaultThemeAppearance()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    // MARK: - Setup
    private func setupView() {
        layer.insertSublayer(gradientLayer, at: 0)

        // Logo
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        // Title
        titleLabel.font = .boldSystemFont(ofSize: 26)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let hStack = UIStackView(arrangedSubviews: [logoImageView, titleLabel])
        hStack.axis = .horizontal
        hStack.spacing = 12
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hStack)

        // Constraints
        NSLayoutConstraint.activate([
            hStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            hStack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),

            logoImageView.widthAnchor.constraint(equalToConstant: 65),
            logoImageView.heightAnchor.constraint(equalToConstant: 65)
        ])

        // Decorative circles
        addDecorativeCircles()
    }

    private func addDecorativeCircles() {

        func makeCircle(size: CGFloat, alpha: CGFloat) -> UIView {
            let c = UIView()
            c.backgroundColor = UIColor.white.withAlphaComponent(alpha)
            c.layer.cornerRadius = size / 2
            c.translatesAutoresizingMaskIntoConstraints = false
            addSubview(c)
            NSLayoutConstraint.activate([
                c.widthAnchor.constraint(equalToConstant: size),
                c.heightAnchor.constraint(equalToConstant: size)
            ])
            return c
        }

        let c1 = makeCircle(size: 150, alpha: 0.08)
        let c2 = makeCircle(size: 110, alpha: 0.10)
        let c3 = makeCircle(size: 80, alpha: 0.12)

        NSLayoutConstraint.activate([
            c1.topAnchor.constraint(equalTo: topAnchor, constant: -25),
            c1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -30),

            c2.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            c2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            c3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            c3.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    // MARK: - THEME UPDATE
    func applyTheme(_ theme: Theme) {
        gradientLayer.colors = [theme.headerGradientTop.cgColor,
                                theme.headerGradientBottom.cgColor]

        titleLabel.textColor = theme.headerTextColor
    }

    private func applyDefaultThemeAppearance() {
        gradientLayer.colors = [
            UIColor(red: 60/255, green: 120/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 120/255, green: 80/255, blue: 255/255, alpha: 1).cgColor
        ]
    }
}
