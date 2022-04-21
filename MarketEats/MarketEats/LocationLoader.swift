//
//  LocationLoader.swift
//  MarketEats
//
//  Created by Alexis Powell on 4/21/22.
//

import Foundation
import MapKit

public class LocationLoader {
    @Published var locationData = [Location]()
    init(){
        loadLocations()
    }
    /*
     Load the JSON Data
     */
    func loadLocations(){
        if let fileLocation = Bundle.main.url(forResource: "loc", withExtension: "json"){
            
            //do catch
            do {
                let locationInfo = try Data(contentsOf: fileLocation)
                
                let jsonDecoder = JSONDecoder()
                
                let dataFromJson = try jsonDecoder.decode([Location].self, from: locationInfo)
                self.locationData = dataFromJson
                
            }catch{
                print(error)
            }
            
        }
        
    }
    
}


