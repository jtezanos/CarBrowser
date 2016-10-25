//
//  UIImage.swift
//  CarBrowser
//
//  Created by Jason Tezanos on 10/25/16.
//
//

import Alamofire
import AlamofireImage
import UIKit

extension UIImageView {
    func setImageFromURL(url: String) {
        Alamofire.request(url).responseImage { response in
            debugPrint(response)
            
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
                self.image = image
            }
        }

    }
}

