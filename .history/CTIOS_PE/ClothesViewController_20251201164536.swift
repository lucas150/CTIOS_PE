//
//  ClothesViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 26/07/25.
//

//import UIKit
//import CleverTapSDK
//
//class ClothesViewController: UIViewController {
//
//    @IBOutlet weak var img1: UIImageView!
//    @IBOutlet weak var img2: UIImageView!
//    @IBOutlet weak var img3: UIImageView!
//    @IBOutlet weak var img4: UIImageView!
//    @IBOutlet weak var img5: UIImageView!
//    @IBOutlet weak var img6: UIImageView!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let clothes = CleverTap.sharedInstance()?.getVariableValue("Clothes") as? [String: Any] {
//            loadImage(from: clothes["Clothes Product 1"] as? String, into: img1)
//            loadImage(from: clothes["Clothes Product 2"] as? String, into: img2)
//            loadImage(from: clothes["Clothes Product 3"] as? String, into: img3)
//            loadImage(from: clothes["Clothes Product 4"] as? String, into: img4)
//            loadImage(from: clothes["Clothes Product 5"] as? String, into: img5)
//            loadImage(from: clothes["Clothes Product 6"] as? String, into: img6)
//        } else {
//            print("Failed to fetch Beauty data from CleverTap")
//        }
//    }
//
//}

//
//  ViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 25/07/25.
//

































////
//  ClothesViewController.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 26/07/25.
//

import UIKit
import CleverTapSDK

class ClothesViewController: UIViewController,
                             UICollectionViewDataSource,
                             UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {

    // MARK: - Header UI
    private let headerView = UIView()
    private let headerGradient = CAGradientLayer()
    private let logoImageView = UIImageView()
    private let taglineLabel = UILabel()
    private let themePillButton = UIButton(type: .system)

    // MARK: - Scroll area
    private let scrollView = UIScrollView()
    private let vStack = UIStackView()

    // MARK: - Banner Carousel
    private var carouselCollection: UICollectionView!
    private var bannerImages: [String] = []
    private var infiniteImages: [String] = []


    // MARK: - Categories section
    private let categoriesLabel = UILabel()
    private let categoriesStack = UIStackView()

    // MARK: - Challenges section
    private let challengesLabel = UILabel()
    private let challengesStack = UIStackView()

    // MARK: - Buttons
    private let loginButton = UIButton(type: .system)
    private let themeButton = UIButton(type: .system)

    // HIDDEN IMAGES (FUTURE USE)
    @IBOutlet weak var img1: UIImageView?
    @IBOutlet weak var img2: UIImageView?
    @IBOutlet weak var img3: UIImageView?
    @IBOutlet weak var img4: UIImageView?
    @IBOutlet weak var img5: UIImageView?
    @IBOutlet weak var img6: UIImageView?
    private var hiddenImages: [UIImageView] = []
    
    private var autoTimer: Timer?
    private var isAutoScrolling = false

    private var autoIndex = 1   // because infinite carousel starts at item 1



    // =====================================================================
    // MARK: - VIEW DID LOAD
    // =====================================================================

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemGroupedBackground

        loadBannerImages()
        setupHeader()
        setupScrollView()
        setupBannerSection1()
        setupCategoriesSection()
        setupChallengesSection()
        setupBottomButtons()

        hideUnusedImages()
        setupTheme()

        print("🎉 ClothesViewController Loaded Successfully")
    }


    // =====================================================================
    // MARK: - CLEVERTAP DATA
    // =====================================================================

    func loadBannerImages() {
        if let clothes = CleverTap.sharedInstance()?.getVariableValue("Beauty") as? [String: Any] {

            bannerImages = [
                clothes["Beauty Banner Image 1"] as? String,
                clothes["Beauty Banner Image 2"] as? String,
                clothes["Beauty Banner Image 3"] as? String
            ].compactMap { $0 }

            prepareInfiniteCarousel()
            print("Clothes Banners:", bannerImages)
        }
    }
    
    // Called when user stops dragging
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        adjustInfiniteScroll()
    }

    // Called after auto-scroll animation finishes
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        adjustInfiniteScroll()
    }


    // Makes the infinite loop work
    func adjustInfiniteScroll() {

        if isAutoScrolling { return }   // 🔥 prevents double jump

        let width = carouselCollection.bounds.width
        let offset = carouselCollection.contentOffset.x
        let index = Int(round(offset / width))

        if index == 0 {
            let lastReal = infiniteImages.count - 2
            autoIndex = lastReal
            jumpTo(index: lastReal)
        }
        else if index == infiniteImages.count - 1 {
            autoIndex = 1
            jumpTo(index: 1)
        }
        else {
            autoIndex = index
        }
    }








    // =====================================================================
    // MARK: - COLLECTION VIEW
    // =====================================================================

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return infiniteImages.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "carouselCell",
            for: indexPath
        ) as! CarouselImageCell

        loadImage(from: infiniteImages[indexPath.item], into: cell.imgView)
        return cell
    }


    // =====================================================================
    // MARK: - THEME HANDLER
    // =====================================================================

    @objc func themeDidChange() {
        applyCurrentTheme()
    }

    func setupTheme() {
        applyCurrentTheme()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(themeDidChange),
            name: .themeDidChange,
            object: nil
        )
    }

    func applyCurrentTheme() {
        ThemeManager.shared.applyTheme(
            to: self,
            themeButton: loginButton,
            labels: [categoriesLabel, challengesLabel]
        )
    }
}


// =====================================================================
// MARK: - UI BUILDERS
// =====================================================================

extension ClothesViewController {

    // =========================================================
    // MARK: HEADER
    // =========================================================
    func setupHeader() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 170)
        ])

        // Gradient
        headerGradient.colors = [
            UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 1).cgColor,
            UIColor(red: 200/255, green: 40/255, blue: 40/255, alpha: 1).cgColor
        ]
        headerGradient.startPoint = CGPoint(x: 0, y: 0)
        headerGradient.endPoint   = CGPoint(x: 1, y: 1)
        headerGradient.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 170)
        headerView.layer.insertSublayer(headerGradient, at: 0)

        // Logo + tagline
        logoImageView.image = UIImage(named: "aia_white")
        logoImageView.contentMode = .scaleAspectFit

        taglineLabel.text = "HEALTHIER, LONGER,\nBETTER LIVES"
        taglineLabel.textColor = .white
        taglineLabel.numberOfLines = 2
        taglineLabel.font = .boldSystemFont(ofSize: 14)

        let hStack = UIStackView(arrangedSubviews: [logoImageView, taglineLabel])
        hStack.axis = .horizontal
        hStack.spacing = 8
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(hStack)

        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            hStack.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20),
            logoImageView.widthAnchor.constraint(equalToConstant: 50)
        ])

        // Christmas button
        themePillButton.setTitle("Merry Christmas", for: .normal)
        themePillButton.setTitleColor(.white, for: .normal)
        themePillButton.backgroundColor = UIColor.white.withAlphaComponent(0.25)
        themePillButton.layer.cornerRadius = 18
        themePillButton.translatesAutoresizingMaskIntoConstraints = false
        themePillButton.addTarget(self, action: #selector(toggleTheme), for: .touchUpInside)

        headerView.addSubview(themePillButton)
        NSLayoutConstraint.activate([
            themePillButton.centerYAnchor.constraint(equalTo: hStack.centerYAnchor),
            themePillButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            themePillButton.heightAnchor.constraint(equalToConstant: 36),
            themePillButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }


    @objc func toggleTheme() {
        ThemeManager.shared.toggleTheme()
    }


    // =========================================================
    // MARK: SCROLL VIEW + STACK
    // =========================================================
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        vStack.axis = .vertical
        vStack.spacing = 22
        vStack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(vStack)

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            vStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            vStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            vStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            vStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40)
        ])
    }


    // =========================================================
    // MARK: CAROUSEL
    // =========================================================
    
    func prepareInfiniteCarousel() {

        guard bannerImages.count > 1 else {
            infiniteImages = bannerImages
            return
        }

        // Safe infinite sequence: [last, 1, 2, 3, first]
        infiniteImages = []
        infiniteImages.append(bannerImages.last!)  // ghost left
        infiniteImages.append(contentsOf: bannerImages)
        infiniteImages.append(bannerImages.first!) // ghost right
    }
    func setupBannerSection1(){
        let carousel = CarouselView()
        carousel.translatesAutoresizingMaskIntoConstraints = false

        // Convert bannerImages into CarouselItem format
        carousel.items = bannerImages.map { CarouselItem.url($0) }

        carousel.startAutoScroll()

        vStack.addArrangedSubview(carousel)

        NSLayoutConstraint.activate([
            carousel.heightAnchor.constraint(equalToConstant: 220)
        ])

    }
    
    func setupBannerSection() {
        let layout = CarouselFlowLayout()

        carouselCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        carouselCollection.translatesAutoresizingMaskIntoConstraints = false
        carouselCollection.backgroundColor = .clear
        carouselCollection.showsHorizontalScrollIndicator = false
        carouselCollection.clipsToBounds = false
        carouselCollection.dataSource = self
        carouselCollection.delegate = self

        carouselCollection.register(CarouselImageCell.self,
                                    forCellWithReuseIdentifier: "carouselCell")

        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(carouselCollection)

        NSLayoutConstraint.activate([
            carouselCollection.topAnchor.constraint(equalTo: container.topAnchor),
            carouselCollection.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            carouselCollection.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            carouselCollection.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            container.heightAnchor.constraint(equalToConstant: 220)
        ])

        vStack.addArrangedSubview(container)
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if self.infiniteImages.count > 1 {
                self.carouselCollection.scrollToItem(
                    at: IndexPath(item: 1, section: 0),
                    at: .centeredHorizontally,
                    animated: false
                )
                self.startAutoCarousel()
            }
        }

    }
    func startAutoCarousel() {
        autoTimer?.invalidate()

        autoTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            self?.scrollToNextItem()
        }
    }

    // AUTO CAROUSEL
    func scrollToNextItem() {
        guard infiniteImages.count > 1 else { return }

        isAutoScrolling = true
        autoIndex += 1

        if autoIndex == infiniteImages.count - 1 {

            // Animate to ghost-right
            carouselCollection.scrollToItem(
                at: IndexPath(item: autoIndex, section: 0),
                at: .centeredHorizontally,
                animated: true
            )

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
                self.autoIndex = 1
                self.jumpTo(index: 1)
                self.isAutoScrolling = false    // re-enable after jump
            }
            return
        }

        let next = IndexPath(item: autoIndex, section: 0)
        carouselCollection.scrollToItem(at: next, at: .centeredHorizontally, animated: true)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
            self.isAutoScrolling = false
        }
    }




    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        autoTimer?.invalidate()
    }



    // =========================================================
    // MARK: CATEGORY SECTION
    // =========================================================
    func setupCategoriesSection() {
        categoriesLabel.text = "Categories"
        categoriesLabel.font = .boldSystemFont(ofSize: 20)

        categoriesStack.axis = .horizontal
        categoriesStack.spacing = 12
        categoriesStack.distribution = .fillEqually

        categoriesStack.addArrangedSubview(makeTile("cat1"))
        categoriesStack.addArrangedSubview(makeTile("cat2"))
        categoriesStack.addArrangedSubview(makeTile("cat3"))

        let card = makeCard()
        let internalStack = UIStackView(arrangedSubviews: [categoriesLabel, categoriesStack])
        internalStack.axis = .vertical
        internalStack.spacing = 12
        internalStack.translatesAutoresizingMaskIntoConstraints = false

        card.addSubview(internalStack)

        NSLayoutConstraint.activate([
            internalStack.topAnchor.constraint(equalTo: card.topAnchor, constant: 16),
            internalStack.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            internalStack.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            internalStack.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -16),
            categoriesStack.heightAnchor.constraint(equalToConstant: 110)
        ])

        vStack.addArrangedSubview(card)
    }


    // =========================================================
    // MARK: CHALLENGES SECTION
    // =========================================================
    func setupChallengesSection() {
        challengesLabel.text = "Challenges"
        challengesLabel.font = .boldSystemFont(ofSize: 20)

        challengesStack.axis = .horizontal
        challengesStack.spacing = 12
        challengesStack.distribution = .fillEqually

        challengesStack.addArrangedSubview(makeTile("chal1"))
        challengesStack.addArrangedSubview(makeTile("chal2"))
        challengesStack.addArrangedSubview(makeTile("chal3"))

        let card = makeCard()
        let internalStack = UIStackView(arrangedSubviews: [challengesLabel, challengesStack])
        internalStack.axis = .vertical
        internalStack.spacing = 12
        internalStack.translatesAutoresizingMaskIntoConstraints = false

        card.addSubview(internalStack)

        NSLayoutConstraint.activate([
            internalStack.topAnchor.constraint(equalTo: card.topAnchor, constant: 16),
            internalStack.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            internalStack.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            internalStack.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -16),
            challengesStack.heightAnchor.constraint(equalToConstant: 110)
        ])

        vStack.addArrangedSubview(card)
    }


    // =========================================================
    // MARK: BOTTOM BUTTONS
    // =========================================================
    func setupBottomButtons() {
        styleButton(loginButton, title: "Login", color: .systemBlue)
        styleButton(themeButton, title: "Apply Theme", color: .systemOrange)

        themeButton.addTarget(self, action: #selector(toggleTheme), for: .touchUpInside)

        let bottomStack = UIStackView(arrangedSubviews: [loginButton, themeButton])
        bottomStack.axis = .vertical
        bottomStack.spacing = 12

        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        themeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        vStack.addArrangedSubview(bottomStack)
    }
}


// =====================================================================
// MARK: - UI HELPERS
// =====================================================================

extension ClothesViewController {

    func makeCard() -> UIView {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 16
        v.layer.shadowOpacity = 0.1
        v.layer.shadowRadius = 8
        v.layer.shadowOffset = .init(width: 0, height: 3)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }

    func makeTile(_ imgName: String) -> UIView {
        let v = UIView()
        v.layer.cornerRadius = 12
        v.layer.shadowOpacity = 0.1
        v.layer.shadowRadius = 6
        v.layer.shadowOffset = .init(width: 0, height: 3)

        let imgView = UIImageView(image: UIImage(named: imgName))
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 12
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false

        v.addSubview(imgView)

        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: v.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            imgView.bottomAnchor.constraint(equalTo: v.bottomAnchor)
        ])

        return v
    }

    func styleButton(_ btn: UIButton, title: String, color: UIColor) {
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = color
        btn.layer.cornerRadius = 20
        btn.layer.shadowOpacity = 0.20
        btn.layer.shadowRadius = 6
        btn.layer.shadowOffset = .init(width: 0, height: 3)
        btn.translatesAutoresizingMaskIntoConstraints = false
    }

    func hideUnusedImages() {
        hiddenImages = [img1, img2, img3, img4, img5, img6].compactMap { $0 }
        hiddenImages.forEach {
            $0.alpha = 0
            $0.isHidden = true
            $0.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
    }
    
    // =========================================================
    // MARK: -  jumpTo(index:)
    // =========================================================
    func jumpTo(index: Int) {
        guard index >= 0, index < infiniteImages.count else { return }
        let target = IndexPath(item: index, section: 0)
        // Temporarily flag to avoid adjustInfiniteScroll reacting mid-jump
        isAutoScrolling = true
        carouselCollection.scrollToItem(at: target, at: .centeredHorizontally, animated: false)
        // Yield to runloop to ensure contentOffset is applied before clearing the flag
        DispatchQueue.main.async { [weak self] in
            self?.isAutoScrolling = false
        }
    }
}


// =====================================================================
// MARK: - CAROUSEL CELL
// =====================================================================

class CarouselImageCell: UICollectionViewCell {

    let imgView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 20
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(imgView)

        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowRadius = 10
        layer.shadowOffset = .init(width: 0, height: 4)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// =====================================================================
// MARK: - ADVANCED CAROUSEL LAYOUT (Zooming)
// =====================================================================

//class CarouselFlowLayout: UICollectionViewFlowLayout {
//
//    let activeDistance: CGFloat = 200            // how far side items shrink
//    let zoomFactor: CGFloat = 0.25               // scale down on sides
//    let sideItemAlpha: CGFloat = 0.35            // fade sides
//    let sidePeek: CGFloat = 40                   // how much side items should appear
//
//    override func prepare() {
//        super.prepare()
//
//        scrollDirection = .horizontal
//        minimumLineSpacing = -sidePeek           // 🔥 removes gaps
//
//        guard let cv = collectionView else { return }
//
//        // 🔥 Make cell smaller so sides peak
//        let width = cv.bounds.width * 0.90
//        let height = cv.bounds.height * 0.85
//
//        itemSize = CGSize(width: width, height: height)
//
//        cv.decelerationRate = .fast
//        cv.clipsToBounds = false                 // allow side preview
//    }
//
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        return true
//    }
//
//    override func layoutAttributesForElements(in rect: CGRect)
//        -> [UICollectionViewLayoutAttributes]? {
//
//        guard let attributes = super.layoutAttributesForElements(in: rect),
//              let cv = collectionView else { return nil }
//
//        let centerX = cv.contentOffset.x + cv.bounds.width / 2
//
//        for attr in attributes {
//            let distance = abs(attr.center.x - centerX)
//            let normalized = min(1, distance / activeDistance)
//
//            // 🔥 SCALE center card
//            let zoom = 1 - zoomFactor * normalized
//            attr.transform = CGAffineTransform(scaleX: zoom, y: zoom)
//
//            // 🔥 OPACITY for side cards
//            attr.alpha = 1 - (1 - sideItemAlpha) * normalized
//        }
//
//        return attributes
//    }
//
//    // 🔥 Snap to center
//    override func targetContentOffset(forProposedContentOffset proposed: CGPoint,
//                                      withScrollingVelocity velocity: CGPoint)
//        -> CGPoint {
//
//        guard let cv = collectionView else { return proposed }
//
//        let targetRect = CGRect(x: proposed.x, y: 0, width: cv.bounds.width, height: cv.bounds.height)
//
//        guard let attributes = super.layoutAttributesForElements(in: targetRect) else {
//            return proposed
//        }
//
//        let centerX = proposed.x + cv.bounds.width / 2
//
//        var closest = attributes[0]
//        for attr in attributes {
//            if abs(attr.center.x - centerX) < abs(closest.center.x - centerX) {
//                closest = attr
//            }
//        }
//
//        return CGPoint(x: closest.center.x - cv.bounds.width / 2, y: proposed.y)
//    }
//}

class MyCollectionView1: UICollectionViewCell {

    let myImageView = UIImageView()
    private var blurView: UIVisualEffectView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        myImageView.frame = contentView.bounds
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 18
        contentView.addSubview(myImageView)

        let blurEffect = UIBlurEffect(style: .light)
        blurView = UIVisualEffectView(effect: nil)
        blurView.frame = contentView.bounds
        blurView.layer.cornerRadius = 18
        blurView.clipsToBounds = true
        contentView.addSubview(blurView)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func applyBlur(intensity: CGFloat) {
        // intensity: 0 = no blur, 1 = full blur
        blurView.effect = UIBlurEffect(style: .light).settingIntensity(intensity)
    }
}

extension UIBlurEffect {
    func settingIntensity(_ intensity: CGFloat) -> UIBlurEffect {
        let key = "blurRadius"
        let blurEffect = self
        blurEffect.setValue(intensity * 10, forKeyPath: key)
        return blurEffect
    }
}



// =====================================================================
// MARK: IMAGE LOADER
// =====================================================================

func loadImage(from urlString: String?, into imageView: UIImageView) {
    guard let urlString = urlString,
          let url = URL(string: urlString) else { return }

    URLSession.shared.dataTask(with: url) { data, _, _ in
        if let data = data,
           let img = UIImage(data: data) {
            DispatchQueue.main.async {
                imageView.image = img
            }
        }
    }.resume()
}
