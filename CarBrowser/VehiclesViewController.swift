//
//  VehiclesViewController.swift
//  CarBrowser
//
//  Created by Jason Tezanos on 10/23/16.
//
//

import UIKit

class VehiclesViewController: UIViewController {
    //MARK: JSON Reader gets our JSON and returns our [Vehicle]
    let reader = JSONReader()
    
    //MARK: Outlets
    @IBOutlet weak var vehiclesTableView: UITableView!
    @IBOutlet weak var vehicleImageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: Variables used for populating our tableView
    var vehicles = [Vehicle]()
    var filteredVehicles = [Vehicle]()
    var showFilteredResults = false
    
    //MARK: ⚡️ Lifecycle ⚡️
    override func viewDidLoad() {
        initialSetup()
    }
    
    //MARK: Filter our vehicles based on searchString
    func filterVehiclesArray(filter: String)  {
        let splitStringArray = filter.components(separatedBy: " ")
        print(splitStringArray)
        for str in splitStringArray {
            if str != "" {
                filteredVehicles = vehicles.filter { ($0.make!.lowercased().range(of: str.lowercased()) != nil) }
                filteredVehicles += vehicles.filter { ($0.model!.lowercased().range(of: str.lowercased()) != nil) }
                filteredVehicles += vehicles.filter { (String($0.year).lowercased().range(of: str.lowercased()) != nil) }
            }
        }

    }
    //MARK: Initial Setup
    private func initialSetup() {
        setDelegates()
        getVehicles()
    }
    private func getVehicles() {
        reader.getVehiclesFromFile() { vehicles in
            self.vehicles = vehicles
            self.vehiclesTableView.reloadData()
        }
    }
    private func setDelegates() {
        searchBar.delegate = self
    }
}

//MARK: - TableView DataSource
extension VehiclesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! VehicleTableViewCell
        let vehiclesToPopulate = showFilteredResults ? filteredVehicles : vehicles
        
        cell.setupCell(withDelegate: VehicleViewModel(VehicleAtIndex: vehiclesToPopulate[indexPath.row]))
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return showFilteredResults ? filteredVehicles.count : vehicles.count
    }
}

//MARK: - TableView Delegate
extension VehiclesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vehiclesThatArePresent = showFilteredResults ? filteredVehicles : vehicles

        searchBar.resignFirstResponder()
        vehicleImageView.imageFromURL(url: vehiclesThatArePresent[indexPath.row].imageURL!)
    }
}

//MARK: - SearchBar Delegate
extension VehiclesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        switch searchText {
        case "" :
            showFilteredResults = false
        default:
            showFilteredResults = true
        }
        filterVehiclesArray(filter: searchBar.text!)
        self.vehiclesTableView.reloadData()
    }

}

//MARK: - Status Bar Hidden 
extension VehiclesViewController {
    override var prefersStatusBarHidden: Bool {
        return true
    } 
}
