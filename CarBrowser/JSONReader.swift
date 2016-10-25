//
//  JSONReader.swift
//  CarBrowser
//
//  Created by Jason Tezanos on 10/24/16.
//
//

import Foundation

typealias JSONDictionary = [NSDictionary]

final class JSONReader {
    
    func getVehiclesFromFile(completion: (_ vehicles: [Vehicle]) -> Void) {
        completion(readJSONFromFile().map { Vehicle(JSON: $0) })
    }
    
    fileprivate func readJSONFromFile() -> JSONDictionary {
        if let url = Bundle.main.url(forResource: "vehicles", withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {

                    let jsonDict = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? JSONDictionary
                    
                    return jsonDict!
                } catch {
                    print("Cannot to parse vehicles.json")
                }
            }
            print("Cannot load vehicles.json")
        }
        
        return JSONDictionary()

    }
    
}
