//
//  Helper.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 03/12/25.
//

import UIKit

extension UIViewController {
    func navigateTo(_ controller: UIViewController) {
        controller.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func loadVC<T: UIViewController>(_ type: T.Type) -> T {
        let identifier = String(describing: type)
        return UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: identifier) as! T
    }
    
}

extension UIColor {
    convenience init(hex: String) {
        var cleanHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cleanHex.hasPrefix("#") {
            cleanHex.removeFirst()
        }

        // Invalid hex length? default to black
        guard cleanHex.count == 6 else {
            self.init(white: 0.0, alpha: 1.0)
            return
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cleanHex).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}


extension Themeable where Self: UIViewController {
    func applyTheme(_ theme: ThemeProtocol) {
        view.backgroundColor = theme.background
    }
}

extension Notification.Name {
    static let themeDidChange = Notification.Name("themeDidChange")
}




func loadImage(from urlString: String?, into imageView: UIImageView, completion: ((UIImage?) -> Void)? = nil) {
    guard let urlString = urlString,
          let url = URL(string: urlString) else {
        completion?(nil)
        return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Image download error:", error)
            completion?(nil)
            return
        }

        guard
            let data = data,
            let image = UIImage(data: data)
        else {
            print("Failed to decode image from:", url)
            completion?(nil)
            return
        }

        DispatchQueue.main.async {
            imageView.image = image
            completion?(image)
        }
    }.resume()
}
