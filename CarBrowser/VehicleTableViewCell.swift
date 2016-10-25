//
//  VehicleTableViewCell.swift
//  CarBrowser
//
//  Created by Jason Tezanos on 10/25/16.
//
//

import Foundation
import UIKit


protocol VehicleCellProtocol {
    var year: Int { get set }
    var make: String { get set }
    var model: String { get set }
    var mileage: Int { get set }
    var imageURL: String { get set }
}

class VehicleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var mileageLabel: UILabel!
    
    private var delegate: VehicleCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setupCell(withDelegate delegate: VehicleCellProtocol) {
        self.delegate = delegate
        self.yearLabel.text = String(describing:self.delegate!.year)
        self.makeLabel.text = self.delegate?.make
        self.modelLabel.text = self.delegate?.model
        self.mileageLabel.text = String(describing:self.delegate!.mileage) + " Miles"
    }

}
