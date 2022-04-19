//
//  MapView.swift
//  MarketEats
//
//  Created by Alexis Powell on 12/17/21.
//

import UIKit
import MapKit
import SwiftUI

class MarketMapView: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let marketData = marketDataLoader().marketInfo
    
    @IBOutlet weak var segmentButtons: UISegmentedControl!
    @IBOutlet weak var marketsMap: MKMapView!
    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
 
        marketTableView.delegate = self
        marketTableView.dataSource = self
        configureLocationServices()
         
    }
    
    @IBOutlet weak var marketTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int{
        return marketData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        
        cell.textLabel!.text = marketData[indexPath.row].MarketName
        
        cell.textLabel?.numberOfLines=0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        return cell
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
    
    // Code for Segmented Control, add annotations
    var marketIsVisible = true // indicate if market is visible
    var banksIsVisible = false // indicat if foodbanks are visible
    
    @IBAction func isSegmentChanged(_ sender: UISegmentedControl) {
        sender.selectedSegmentIndex = 0
        
        if sender.selectedSegmentIndex == 1 {
            marketIsVisible = false
            banksIsVisible = true
            
            showFarmersMarket() //remove markets first
            showFoodBanks()
            //print("Nothing Happens")
        }
        else{
            marketIsVisible = true
            banksIsVisible = false
            
            showFoodBanks() // remove banks first
            showFarmersMarket()
        }
        
    }

    func showFarmersMarket(){
        //showcase markets information
        /*
         Insert code for map
         Insert code for listView
         */
        
        if marketIsVisible == true{
            //showcase farmer's market information
            let farmMarketAnnotation = MKPointAnnotation()
            
            farmMarketAnnotation.title = "Wakefield"
            //(x,y) - (longitude, latitude)
            farmMarketAnnotation.coordinate = CLLocationCoordinate2D(latitude: 38.832801, longitude: -77.196229)
            //Season 1 Time
            farmMarketAnnotation.subtitle = "Wed: 2:00 PM-6:00 PM"
            
            let test = MKPointAnnotation()
            
            test.title = "Test Annotation"
            //(x,y) - (longitude, latitude)
            test.coordinate = CLLocationCoordinate2D(latitude: 38.832800, longitude: -80.196200)
            //Season 1 Time
            test.subtitle = "Wed: 2:00 PM-6:00 PM"
            
            //marketsMap.addAnnotation(farmMarketAnnotation)
            marketsMap.showAnnotations([farmMarketAnnotation, test], animated: true)
        }
        else{
            marketsMap.removeAnnotations(marketsMap.annotations)
        }
    }
    
    func showFoodBanks(){
        //showcase food banks information
        /*
         Insert code for map
         Insert code for listView
         */
        
        if banksIsVisible == true{
            //showcase farmer's market information
            let foodBanksAnnotation = MKPointAnnotation()
            
            foodBanksAnnotation.title = "Grace Place"
            //(x,y) - (longitude, latitude)
            foodBanksAnnotation.coordinate = CLLocationCoordinate2D(latitude:31.1720 , longitude: -81.5018)
            //Season 1 Time
            foodBanksAnnotation.subtitle = "Sun: 8:00 AM-4:00 PM"
            
            let test = MKPointAnnotation()
            
            test.title = "Test Annotation"
            //(x,y) - (longitude, latitude)
            test.coordinate = CLLocationCoordinate2D(latitude: 38.832800, longitude: -77.196200)
            //Season 1 Time
            test.subtitle = "Wed: 2:00 PM-6:00 PM"
            
            //marketsMap.addAnnotation(farmMarketAnnotation)
            marketsMap.showAnnotations([foodBanksAnnotation, test], animated: true)
        }
        else{
            marketsMap.removeAnnotations(marketsMap.annotations)
        }
        
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
            //isSegmentChanged(segmentButtons)
            showFarmersMarket()
        }
        currentCoordinate = latestLocation.coordinate
    }
}
