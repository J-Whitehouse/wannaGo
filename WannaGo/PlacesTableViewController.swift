//
//  PlacesTableViewController.swift
//  WannaGo
//
//  Created by Whitehouse, Jarret M on 11/8/21.
//


import UIKit
import MapKit
import CoreLocation
import GoogleSignIn
import Firebase

class PlacesTableViewController: UITableViewController, CLLocationManagerDelegate {
    
    //MARK: Attributes
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
                    self.tableView.reloadData()
                }
            }
        }
        
        // MARK: Custom Methods
        
        func loadData() {
            service = PlaceService()
            var collection = ""
            if let user = GIDSignIn.sharedInstance.currentUser {
                collection = user.userID!
            }
            service?.get(collectionID: collection) {
                places in
                self.allPlaces = places
            }
        }
        
        // MARK: Event Lifecycle Functions
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
        }
        
        override func viewDidLoad() {
            //Load this data from Firestore
            loadData()
            
        }
        
        //MARK: Table View Controller requires two methods
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return places.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //Create an instance if tge UITableViewCell with default appearance
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            
            
            cell.textLabel?.text = places[indexPath.row].PlaceName
            print(places[indexPath.row].PlaceAdminArea)
            cell.detailTextLabel?.text = places[indexPath.row].PlaceAdminArea
            
        
            return cell
        }
    
    /*func addAnnotation(location: CLLocationCoordinate2D, title: String?, subtitle: String?){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title ?? ""
        annotation.subtitle = subtitle ?? ""
        ViewController.addAnnotation(annotation)
    }
 */
    
    // MARK: Segue
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "AddNewPlaceSegue" {
                
                // Get a reference to the destination view controller
                let mapView = segue.destination as! AddPlaceViewController
                
                /* --------------------------------- This is supposed to be the annotation code --------------------------- */
                /*
                for place in places {
                    let coordinate = CLLocationCoordinate2D(latitude: Double(place.Latitude), longitude: Double(place.Longitude))
                    
                    self.addAnnotation(location: coordinate, title: place.PlaceName, subtitle: place.PlaceAdminArea)
                }
                */
            }
        }
    
    
    
 
}

