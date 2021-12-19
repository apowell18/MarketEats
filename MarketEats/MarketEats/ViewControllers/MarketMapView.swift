//
//  MapView.swift
//  MarketEats
//
//  Created by Alexis Powell on 12/17/21.
//

import UIKit
import MapKit

class MarketMapView: UIViewController{

    @IBOutlet weak var marketsMap: MKMapView!
    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationServices()
    }
    
    private func configureLocationServices(){
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined{
           //request permission
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
    
        }else if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: locationManager)
        }
        else {
            print("Permission Denied")
        }
    }
    
    private func updateLocation(with coordinate: CLLocationCoordinate2D ){
        let area = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        marketsMap.setRegion(area, animated: true)
    }
    
    private func beginLocationUpdates(locationManager: CLLocationManager){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        //locationManager.startUpdatingLocation()

        //indicate location services
        locationManager.showsBackgroundLocationIndicator = true
        
        //showcase user location
        marketsMap.showsUserLocation = true
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

extension MarketMapView: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: locationManager)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {return}
        if currentCoordinate == nil{
            updateLocation(with: latestLocation.coordinate)
        }
        currentCoordinate = latestLocation.coordinate
    }
}
