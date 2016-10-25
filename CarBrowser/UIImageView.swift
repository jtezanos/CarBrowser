//
//  UIImageView.swift
//  CarBrowser
//
//  Created by Jason Tezanos on 10/25/16.
//
//

import Alamofire
import AlamofireImage

extension UIImageView {
    func imageFromURL(url: String) {
        Alamofire.request(url).responseImage { response in
            debugPrint(response)
            
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value {
                self.image = image
                self.animatedImage(image: image)
            }
        }
    }
    func animatedImage(image: UIImage) {
        UIView.animate(withDuration: 1.0, delay: 0.0,
                       usingSpringWithDamping: 0.25,
                       initialSpringVelocity: 0.0,
                       options: [],
                       animations: {
                        self.layer.cornerRadius = 7
                        self.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.2)
            }, completion: nil)
    }
}
