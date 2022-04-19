//
//  marketInfo.swift
//  MarketEats
//
//  Created by Alexis Powell on 4/19/22.
//

import Foundation
import SwiftUI

struct MarketInfo: Decodable {
    var MarketName: String
    var Website: String
    var Facebook: String
    var street: String
    var city: String
    var County: String
    var State: String
    var zip: Int
    var Season1Time: String
    var Longitude: Double
    var Langitude: Double
    
}
