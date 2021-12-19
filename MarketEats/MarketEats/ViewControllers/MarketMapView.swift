//
//  MapView.swift
//  MarketEats
//
//  Created by Alexis Powell on 12/17/21.
//

import UIKit
import MapKit

class MarketMapView: UIViewController, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    //private var currentCoordinate: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        //configureLocationServices()
       
    }
    /*
    private func configureLocationServices(){
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined{
            locationManager.requestAlwaysAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
        }else{
            
        }
    }
    */
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


