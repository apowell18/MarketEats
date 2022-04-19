//
//  marketDataLoader.swift
//  MarketEats
//
//  Created by Alexis Powell on 4/19/22.
//

import Foundation

public class marketDataLoader {
    @Published var marketInfo = [MarketInfo]()
    init(){
        loadMarkets()
 
    }
    /*
     Load the JSON Data
     */
    func loadMarkets(){
        if let fileLocation = Bundle.main.url(forResource: "markets", withExtension: "json"){
            
            //do catch
            do {
                let marketData = try Data(contentsOf: fileLocation)
                
                let jsonDecoder = JSONDecoder()
                
                let dataFromJson = try jsonDecoder.decode([MarketInfo].self, from: marketData)
                
                self.marketInfo = dataFromJson
            }catch{
                print(error)
            }
            
        }
        
    }
    
}


