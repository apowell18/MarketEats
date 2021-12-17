//
//  MapView.swift
//  MarketEats
//
//  Created by Alexis Powell on 12/17/21.
//

import UIKit
import MapKit

class MapView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Code for Segmented Control
    
    @IBAction func isSegmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            //showcase farmer's market information
            /*
             Insert code for map
             Insert code for listView
             */
        }
        else{
            //showcase food banks information
            /*
             Insert code for map
             Insert code for listView
             */
        }
        
    }
    
}
