//
//  TrueMoneyViewController.swift
//  CTIOS_PE
//
//  Created by Pranjal Choudhary on 14/08/25.
//

import UIKit
import CleverTapSDK
 
class TrueMoneyViewController:UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var bills_label: UILabel!
    @IBOutlet weak var Prepaid_label: UILabel!
    @IBOutlet weak var Electricity_label: UILabel!
    @IBOutlet weak var Insaurance_label: UILabel!
    @IBOutlet weak var PayNow: UIButton!
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var TrueMoneyImageView: UIImageView!


    // Icon rows
    var firstIconRow: UIStackView!
    var secondIconRow: UIStackView!
    var cardContainer: UIView!

    var carouselTimer: Timer?
    var currentCarouselIndex = 0
    
    var bannerImageUrls: [String] = [
            "https://cdn.prod.website-files.com/5ee6fcad61bab357cf10c8fa/685387f2e3ed105bfe562c88_TrueMoneyCashInOut01.jpg",
            "https://truemoneytransfer.truemoney.com/wp-content/uploads/2023/05/truemoneytransfer-km-home-banner-4-20230530-1100x550_KH.jpeg",
            "https://pbs.twimg.com/media/EyBKk1TVEAQ9eap?format=jpg&name=4096x4096"
        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeaderUI()
        setupCardUI()
        addCardImage("card_black")
        setupIconRowUI()
        setupSecondIconRowUI()
        setupCarouselConstraints()
        setupPayNowConstraints()
        
        CollectionView.layer.cornerRadius = 16
        CollectionView.clipsToBounds = true

        
        
        let currentValue = UserDefaults.standard.integer(forKey: "contentCounter")
        
        // Calculate next value (1 to 7, looping)
        let nextValue = (currentValue % 3) + 1
        
        // Save updated value for next time
        UserDefaults.standard.set(nextValue, forKey: "contentCounter")
 

//        applyCurrentTheme()
              
        NotificationCenter.default.addObserver(self,
                                            selector: #selector(themeDidChange),
                                            name: .themeDidChange,
                                            object: nil)
    
    }
    
    
    
    
    func setupHeaderUI() {
        let gradientView = UIView()
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)

        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 220)
        ])

        // Gradient Layer
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 60/255, green: 120/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 120/255, green: 80/255, blue: 255/255, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 220)
        gradientView.layer.insertSublayer(gradient, at: 0)

        
        // ---- 2. Decorative Background Circles ----

        func makeCircle(size: CGFloat, alpha: CGFloat) -> UIView {
            let c = UIView()
            c.backgroundColor = UIColor.white.withAlphaComponent(alpha)
            c.layer.cornerRadius = size / 2
            c.translatesAutoresizingMaskIntoConstraints = false
            gradientView.addSubview(c)
            NSLayoutConstraint.activate([
                c.widthAnchor.constraint(equalToConstant: size),
                c.heightAnchor.constraint(equalToConstant: size)
            ])
            return c
        }

        let circle1 = makeCircle(size: 160, alpha: 0.08)
        let circle2 = makeCircle(size: 120, alpha: 0.07)
        let circle3 = makeCircle(size: 80, alpha: 0.10)

        NSLayoutConstraint.activate([
            circle1.topAnchor.constraint(equalTo: gradientView.topAnchor, constant: -30),
            circle1.leadingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -40),

            circle2.topAnchor.constraint(equalTo: gradientView.topAnchor, constant: 40),
            circle2.trailingAnchor.constraint(equalTo: gradientView.trailingAnchor, constant: -10),

            circle3.bottomAnchor.constraint(equalTo: gradientView.bottomAnchor, constant: -30),
            circle3.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor)
        ])

        
        
        // MARK: - Title Image
        let logoImageView = UIImageView()
         logoImageView.image = UIImage(named: "aia_white")      // your logo
         logoImageView.contentMode = .scaleAspectFit
         logoImageView.translatesAutoresizingMaskIntoConstraints = false

         let titleLabel = UILabel()
         titleLabel.text = "AIA"
         titleLabel.textColor = .white
         titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
         titleLabel.translatesAutoresizingMaskIntoConstraints = false

         let hStack = UIStackView(arrangedSubviews: [logoImageView, titleLabel])
         hStack.axis = .horizontal
         hStack.spacing = 12
         hStack.alignment = .center
         hStack.translatesAutoresizingMaskIntoConstraints = false

         gradientView.addSubview(hStack)

         NSLayoutConstraint.activate([
             hStack.topAnchor.constraint(equalTo: gradientView.safeAreaLayoutGuide.topAnchor, constant: -60),
             hStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
             hStack.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor)
         ])

         NSLayoutConstraint.activate([
             logoImageView.widthAnchor.constraint(equalToConstant: 70),
             logoImageView.heightAnchor.constraint(equalToConstant: 70)
         ])
     }
    

    
      
    // MARK: - Card
    func setupCardUI() {
        let card = UIView()
        card.layer.cornerRadius = 20
        card.layer.shadowOpacity = 0.15
        card.layer.shadowRadius = 12
        card.layer.shadowOffset = CGSize(width: 0, height: 6)
        card.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(card)
        self.cardContainer = card

        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            card.heightAnchor.constraint(equalToConstant: 180)
        ])

        // ---- Gradient Background ----
        let cardGradient = CAGradientLayer()
        cardGradient.colors = [
            UIColor(red: 120/255, green: 180/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 80/255, green: 120/255, blue: 230/255, alpha: 1).cgColor
        ]
        cardGradient.cornerRadius = 20
        cardGradient.frame = CGRect(x: 0, y: 0, width: view.frame.width - 40, height: 180)
        card.layer.insertSublayer(cardGradient, at: 0)


        // ---- Decorative Circles ----
        func makeCircle(size: CGFloat, alpha: CGFloat) -> UIView {
            let c = UIView()
            c.backgroundColor = UIColor.white.withAlphaComponent(alpha)
            c.layer.cornerRadius = size / 2
            c.translatesAutoresizingMaskIntoConstraints = false
            card.addSubview(c)
            NSLayoutConstraint.activate([
                c.widthAnchor.constraint(equalToConstant: size),
                c.heightAnchor.constraint(equalToConstant: size)
            ])
            return c
        }

        let circle1 = makeCircle(size: 140, alpha: 0.15)
        let circle2 = makeCircle(size: 90, alpha: 0.12)
        let circle3 = makeCircle(size: 60, alpha: 0.10)

        NSLayoutConstraint.activate([
            // Large circle left
            circle1.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: -30),
            circle1.topAnchor.constraint(equalTo: card.topAnchor, constant: -20),

            // Medium circle right
            circle2.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -10),
            circle2.topAnchor.constraint(equalTo: card.topAnchor, constant: 30),

            // Small circle bottom-center
            circle3.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            circle3.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -20)
        ])
    }

    func addCardImage(_ imageName: String) {
        let imgView = UIImageView()
        imgView.image = UIImage(named: imageName)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 20
        imgView.translatesAutoresizingMaskIntoConstraints = false

        cardContainer.addSubview(imgView)

        NSLayoutConstraint.activate([
            imgView.centerXAnchor.constraint(equalTo: cardContainer.centerXAnchor),
              imgView.centerYAnchor.constraint(equalTo: cardContainer.centerYAnchor),
              imgView.widthAnchor.constraint(equalTo: cardContainer.widthAnchor, multiplier: 1.2),
              imgView.heightAnchor.constraint(equalTo: cardContainer.heightAnchor, multiplier: 1.2)
        ])
    }
    
    
    
   

      
      // MARK: - FIRST Row Icons
      func setupIconRowUI() {
          let iconNames = ["doc.text", "shield", "bolt.fill", "creditcard"]
          let titles = ["Bills", "Insurance", "Electricity", "Prepaid"]

          let stack = makeIconRow(iconNames: iconNames, titles: titles)
          
          view.addSubview(stack)

          NSLayoutConstraint.activate([
              stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220),
              stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              stack.heightAnchor.constraint(equalToConstant: 100)
          ])

          firstIconRow = stack
      }
      
      // MARK: - SECOND Row Icons
      func setupSecondIconRowUI() {
          let iconNames = ["wallet.pass", "house.fill", "gift.fill", "phone.fill"]
          let titles = ["Wallet", "Home", "Rewards", "Mobile"]

          let stack = makeIconRow(iconNames: iconNames, titles: titles)

          view.addSubview(stack)

          NSLayoutConstraint.activate([
              stack.topAnchor.constraint(equalTo: firstIconRow.bottomAnchor, constant: 20),
              stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              stack.heightAnchor.constraint(equalToConstant: 100)
          ])
          
          secondIconRow = stack
      }

      // MARK: - Reusable Icon Creator
      func makeIconView(icon: String, title: String) -> UIView {
          let container = UIStackView()
          container.axis = .vertical
          container.alignment = .center
          container.spacing = 8

          let bgCircle = UIView()
          bgCircle.backgroundColor = .white
          bgCircle.layer.cornerRadius = 30
          bgCircle.layer.shadowOpacity = 0.12
          bgCircle.layer.shadowRadius = 6
          bgCircle.layer.shadowOffset = CGSize(width: 0, height: 4)
          bgCircle.translatesAutoresizingMaskIntoConstraints = false
          bgCircle.widthAnchor.constraint(equalToConstant: 60).isActive = true
          bgCircle.heightAnchor.constraint(equalToConstant: 60).isActive = true

          let img = UIImageView(image: UIImage(systemName: icon))
          img.tintColor = UIColor(red: 70/255, green: 120/255, blue: 255/255, alpha: 1)
          img.contentMode = .scaleAspectFit
          img.translatesAutoresizingMaskIntoConstraints = false

          bgCircle.addSubview(img)
          
          NSLayoutConstraint.activate([
              img.centerXAnchor.constraint(equalTo: bgCircle.centerXAnchor),
              img.centerYAnchor.constraint(equalTo: bgCircle.centerYAnchor),
              img.widthAnchor.constraint(equalToConstant: 28),
              img.heightAnchor.constraint(equalToConstant: 28)
          ])

          let label = UILabel()
          label.text = title
          label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
          label.textColor = .darkGray

          container.addArrangedSubview(bgCircle)
          container.addArrangedSubview(label)

          return container
      }
      
      func makeIconRow(iconNames: [String], titles: [String]) -> UIStackView {
          let stack = UIStackView()
          stack.axis = .horizontal
          stack.distribution = .fillEqually
          stack.alignment = .center
          stack.spacing = 24
          stack.translatesAutoresizingMaskIntoConstraints = false
          
          for i in 0..<iconNames.count {
              stack.addArrangedSubview(makeIconView(icon: iconNames[i], title: titles[i]))
          }
          return stack
      }
      
      // MARK: - Place Carousel
      func setupCarouselConstraints() {
          CollectionView.translatesAutoresizingMaskIntoConstraints = false
          
          NSLayoutConstraint.activate([
              CollectionView.topAnchor.constraint(equalTo: secondIconRow.bottomAnchor, constant: 20),
              CollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              CollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              CollectionView.heightAnchor.constraint(equalToConstant: 200)
          ])
      }
      
      // MARK: - Place Pay Now Button
      func setupPayNowConstraints() {
          PayNow.translatesAutoresizingMaskIntoConstraints = false
          
          NSLayoutConstraint.activate([
              PayNow.topAnchor.constraint(equalTo: CollectionView.bottomAnchor, constant: 35),
              PayNow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
              PayNow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
              PayNow.heightAnchor.constraint(equalToConstant: 55)
          ])
          
          PayNow.layer.cornerRadius = 28
      }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! TrueMoneyCollectionViewCell
        
        let imageUrl = bannerImageUrls[indexPath.item]
            print(":camera_with_flash: Loading image for cell \(indexPath.item): \(imageUrl)")
        
        loadImage(from: bannerImageUrls[indexPath.item], into: cell.truemoneyImageView)
        return cell

    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionView.frame.width, height: CollectionView.frame.height)

    }
    func startCarouselTimer() {
        carouselTimer?.invalidate()
        carouselTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            guard self.bannerImageUrls.count > 1 else { return }
            self.currentCarouselIndex = (self.currentCarouselIndex + 1) % self.bannerImageUrls.count
            let indexPath = IndexPath(item: self.currentCarouselIndex, section: 0)
            self.CollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
    
    @objc func themeDidChange() {
         applyCurrentTheme()
     }
     
     func applyCurrentTheme() {
         ThemeManager.shared.applyTheme(
             to: self,
             themeButton: PayNow,
             labels: [bills_label,Prepaid_label,Electricity_label,Insaurance_label]
         )
     }
     
     deinit {
         NotificationCenter.default.removeObserver(self)
     }

}
