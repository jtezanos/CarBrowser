//
//  VehicleViewModel.swift
//  CarBrowser
//
//  Created by Jason Tezanos on 10/25/16.
//
//

import Foundation

class VehicleViewModel: VehicleCellProtocol {
    
    var year: Int
    var make: String
    var model: String
    var mileage: Int
    var imageURL: String
    
    init(VehicleAtIndex: Vehicle){
        self.year = VehicleAtIndex.year
        self.make = VehicleAtIndex.make!
        self.model = VehicleAtIndex.model!
        self.mileage = VehicleAtIndex.mileage
        self.imageURL = VehicleAtIndex.imageURL!
    }
    
}
