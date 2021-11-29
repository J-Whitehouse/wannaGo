//
//  ViewController.swift
//  WannaGo
//
//  Created by Whitehouse, Jarret M on 11/8/21.
//

import UIKit
import MapKit
import CoreLocation
import GoogleSignIn
import Firebase

class AddPlaceViewController: UIViewController, CLLocationManagerDelegate {
    
    private var service: PlaceService?
    
    private var allPlaces = [appPlace]() {
        didSet {
            DispatchQueue.main.async {
                self.places = self.allPlaces
            }
        }
    }
    
    var places = [appPlace]() {
        didSet {
            DispatchQueue.main.async {

            }
        }
    }
    
    //MARK: Outlets and Actions
    @IBOutlet var mapView: MKMapView!
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        determineCurrentLocation()
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action:#selector(handleLongTap))
        mapView.addGestureRecognizer(gestureRecognizer)
        
        /*for place in places {
            
            let coordinate = CLLocationCoordinate2D(latitude: Double(place.Latitude), longitude: Double(place.Longitude))
            
            self.addAnnotation(location: coordinate, title: place.PlaceName, subtitle: place.PlaceAdminArea)
        }
 */
        
        
    }
    
    //MARK: Custom Functions
    @objc func handleLongTap(gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .began {
            let locationInView = gestureRecognizer.location(in: mapView)
            let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
            let location = CLLocation(latitude: locationOnMap.latitude, longitude: locationOnMap.longitude)
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                if let places = placemarks {
                    for place in places {
                        print("Found placemark \(place.name) in \(place.administrativeArea), \(place.country) at address \(place.postalCode)")
                        
                        self.addAnnotation(location: locationOnMap, title: place.name, subtitle: place.administrativeArea)
                        
                        //MARK: Atrributes
                            let db = Firestore.firestore()
                                
                                var ref: DocumentReference? = nil
                                
                                var collection = ""
                                if let user = GIDSignIn.sharedInstance.currentUser {
                                    collection = user.userID!
                                }
                                
                                ref = db.collection(collection).addDocument(data: [
                                    "PlaceName": place.name,
                                    "PlaceAdminArea": place.administrativeArea,
                                    "PlaceCountry": place.country,
                                    "PlacePostalCode": place.postalCode,
                                    "PlaceLongitude": locationOnMap.longitude,
                                    "PlaceLatitude": locationOnMap.latitude,
                                ]) { err in
                                    if let err = err{
                                        print("Error writing document: \(err)")
                                    } else {
                                        print("Document added with ID: \(ref!.documentID)")
                                    }
                                }
                                
                                //Dismiss the view controller
                                self.navigationController?.popViewController(animated: true)
                                self.dismiss(animated: true, completion: nil)
                        
                    }
                }
            }
        }
    }
    
    func addAnnotation(location: CLLocationCoordinate2D, title: String?, subtitle: String?){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title ?? ""
        annotation.subtitle = subtitle ?? ""
        self.mapView.addAnnotation(annotation)
    }
    
    
    //MARK: Instance Methods
    func determineCurrentLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK: Delegate Method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation:CLLocation = locations[0] as CLLocation
        let center = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        mapView.setRegion(mRegion, animated: true)
    }

}

