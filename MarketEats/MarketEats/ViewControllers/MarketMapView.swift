//
//  MapView.swift
//  MarketEats
//
//  Created by Alexis Powell on 12/17/21.
//

import UIKit
import MapKit

class MapView: UIViewController {
    
    
    
    
    private let locationManager = CLLocationManager()
   // private var currentCoordinate: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationServices()
        // Do any additional setup after loading the view.
    }
    
    private func configureLocationServices(){
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined{
            locationManager.requestAlwaysAuthorization()
            
        }else{
            
        }
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
    
    func showFarmersMarket(){
        
    }
    
    func showFoodBanks(){
        
    }
    
}

extension MapView: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]){
        
    }
    
    //get user permission
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: [CLAuthorizationStatus]){
        
    }
}
