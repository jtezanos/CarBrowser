//
//  Vehicle.swift
//  CarBrowser
//
//  Created by Jason Tezanos on 10/23/16.
//
//

import Foundation

class Vehicle {
    var year: Int
    var make: String?
    var model: String?
    var mileage: Int
    var imageURL: String?
    
    init(JSON: NSDictionary) {
        self.year = JSON["year"] as? Int ?? 0
        self.make = JSON["make"] as? String ?? "No Make"
        self.model = JSON["model"] as? String ?? "No Model"
        self.mileage = JSON["mileage"] as? Int ?? 0
        self.imageURL = JSON["image_url"] as? String ?? "No URL"
    }
    
}
