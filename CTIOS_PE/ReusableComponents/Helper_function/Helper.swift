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
