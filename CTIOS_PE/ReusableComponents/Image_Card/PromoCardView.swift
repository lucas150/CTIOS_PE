import UIKit

class PromoCardView: UIView {

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    private let carImageView = UIImageView()
    private var buttonAction: (() -> Void)?

    init(title: String,
         subtitle: String,
         buttonTitle: String,
         backgroundColor: UIColor,
         image: UIImage?,
         action: (() -> Void)?)
    {
        super.init(frame: .zero)
        self.buttonAction = action

        setupUI()
        configure(title: title,
                  subtitle: subtitle,
                  buttonTitle: buttonTitle,
                  bgColor: backgroundColor,
                  image: image)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
