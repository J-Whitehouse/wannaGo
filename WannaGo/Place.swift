//
//  Place.swift
//  WannaGo
//
//  Created by Whitehouse, Jarret M on 11/8/21.
//


import UIKit
import Firebase
import CoreLocation
import MapKit

struct appPlace {
    let PlaceID: String?
    let PlaceName: String?
    let PlaceAdminArea: String?
    let PlaceCountry: String?
    let PlacePostalCode: String?
    let Longitude: String?
    let Latitude: String?
}

extension appPlace {
    // Turn a collection of documents from Firestore into an array of appPlaces
    static func build(from documents: [QueryDocumentSnapshot]) -> [appPlace] {
        var places = [appPlace]()
        
        for document in documents {
    
            
            places.append(appPlace(
                PlaceID: document.documentID,
                PlaceName: document["PlaceName"] as? String ?? "",
                PlaceAdminArea: document["AdminArea"] as? String ?? "",
                PlaceCountry: document["Country"] as? String ?? "",
                PlacePostalCode: document["PostalCode"] as? String ?? "",
                Longitude: document["Longitude"] as? String ?? "",
                Latitude: document["Latitude"] as? String ?? ""
                ))
                            
        }
        
        return places
    }
    
    static func buildOne(from document: DocumentSnapshot) -> appPlace {
        

        
        return appPlace(
                        PlaceID: document.documentID,
                        PlaceName: document["PlaceName"] as? String ?? "",
                        PlaceAdminArea: document["AdminArea"] as? String ?? "",
                        PlaceCountry: document["Country"] as? String ?? "",
                        PlacePostalCode: document["PostalCode"] as? String ?? "",
                        Longitude: document["Longitude"] as? String ?? "",
                        Latitude: document["Latitude"] as? String ?? ""
                        )
                      
        
    }
    
}
 
