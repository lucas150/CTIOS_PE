import UIKit

final class HeaderView: UIView {

    // MARK: - UI Elements
    private let gradientLayer = CAGradientLayer()
    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private var decorativeCircles: [UIView] = []


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
        applyTheme()
//        applyDefaultThemeAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        applyTheme()

//        applyDefaultThemeAppearance()
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

        func makeCircle(size: CGFloat, alpha: CGFloat  = 0.12) -> UIView {
            let c = UIView()
            c.backgroundColor = UIColor.white.withAlphaComponent(alpha)
            c.layer.cornerRadius = size / 2
            c.translatesAutoresizingMaskIntoConstraints = false
            addSubview(c)
            decorativeCircles.append(c)   

            NSLayoutConstraint.activate([
                c.widthAnchor.constraint(equalToConstant: size),
                c.heightAnchor.constraint(equalToConstant: size)
            ])
            return c
        }


        let c1 = makeCircle(size: 150)
        let c2 = makeCircle(size: 110)
        let c3 = makeCircle(size: 80)

        NSLayoutConstraint.activate([
            c1.topAnchor.constraint(equalTo: topAnchor, constant: -25),
            c1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -30),

            c2.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            c2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            c3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            c3.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    // MARK: - THEME APPLYING
    func applyTheme() {
        let theme = AppTheme.shared.current

        // Gradient header background
        gradientLayer.colors = [
            theme.primary.withAlphaComponent(0.95).cgColor,
            theme.primary.withAlphaComponent(0.70).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        // Title styling
        titleLabel.font = theme.headerFont
        titleLabel.textColor = theme.textPrimary

        // Decorative circles — tinted based on theme
        decorativeCircles.forEach { circle in
            circle.backgroundColor = theme.cardBackground.withAlphaComponent(0.12)
        }
    }
    
    
    // MARK: Auto-update on Dark/Light Mode Change
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme()
    }


    private func applyDefaultThemeAppearance() {
        gradientLayer.colors = [
            UIColor(red: 60/255, green: 120/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 120/255, green: 80/255, blue: 255/255, alpha: 1).cgColor
        ]
    }
}
