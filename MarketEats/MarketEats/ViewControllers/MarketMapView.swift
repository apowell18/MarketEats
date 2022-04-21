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
        //let allAnnotations = self.marketsMap.annotations
        //self.marketsMap.removeAnnotations(allAnnotations)
        
        super.viewDidLoad()
        marketTableView.delegate = self
        marketTableView.dataSource = self
        configureLocationServices()
        //showMarkets()
    }
    
    @IBOutlet weak var marketTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int{
        return marketData.count
    }
    
    var locs:[MKPointAnnotation] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // populate map as you scroll or search through list of cells
        
        for i in marketData{
            let loc = MKPointAnnotation()
            loc.title = marketData[indexPath.row].MarketName
            loc.coordinate = CLLocationCoordinate2D(latitude: marketData[indexPath.row].Langitude, longitude:marketData[indexPath.row].Longitude)
            locs.append(loc)
            marketsMap.addAnnotation(loc)
        }
        //marketsMap.showAnnotations(locs, animated: true)
        
        cell.textLabel!.text = marketData[indexPath.row].MarketName
        cell.textLabel?.numberOfLines=0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        return cell
    }
    
    //if selected go to the given
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    //}
     
     /*
     let test = MKPointAnnotation()
     
     test.title = marketData[indexPath.row].MarketName
     //(x,y) - (longitude, latitude)
     test.coordinate = CLLocationCoordinate2D(latitude: 40.832800, longitude: -70.196200)
     //Season 1 Time
     test.subtitle = "Wed: 2:00 PM-6:00 PM"
 
     marketsMap.addAnnotation(test)
     
    
    func showMarkets(){
        for i in locs{
           marketsMap.addAnnotation(i)
        }
    }
      */
    
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
    

   
//EOF
    
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
            //showMarkets()
        }
        currentCoordinate = latestLocation.coordinate
    }
}
