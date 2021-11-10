//
//  PlacesTableViewController.swift
//  WannaGo
//
//  Created by Whitehouse, Jarret M on 11/8/21.
//


import UIKit
import Firebase
import GoogleSignIn

class PlacesTableViewController: UITableViewController {
    /*
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "UIPlacesViewCell", for: indexPath)
            
            
            cell.textLabel?.text = places[indexPath.row].placeData
            
        
            return cell
        }
        
        // MARK: Segue
            
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "placeDetailSegue" {
                    
                    // Get a reference to the destination view controller
                    let detailView = segue.destination as! PlaceDetailViewController
                    
                    // Figure out which table cell was clicked
                    if let indexPath = self.tableView.indexPathForSelectedRow {
                        
                        // Get the string ID of the selected task
                        let placeID = places[indexPath.row].placeID!
                        
                        // Set the task ID on the destination view controller
                        detailView.placeID = placeID
                    }
                }
            }
 */
}

