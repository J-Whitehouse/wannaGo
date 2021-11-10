//
//  Place.swift
//  WannaGo
//
//  Created by Whitehouse, Jarret M on 11/8/21.
//

/*
import UIKit
import Firebase
import CoreLocation
import MapKit

struct appPlace {
    let longitude: CLLocationCoordinate2D
    let latitude: CLLocationCoordinate2D
    let PlaceName: String?
    let PlaceAdminArea: String?
    let PlaceCountry: String?
    let PlacePostalCode: Int?
}

extension appPlace {
    // Turn a collection of documents from Firestore into an array of appPlaces
    static func build(from documents: [QueryDocumentSnapshot]) -> [appPlace] {
        var places = [appPlace]()
        
        for document in documents {
    
            
            places.append(appPlace(
                PlaceName: document.documentID,
                PlaceAdminArea: document["AdminArea"] as? String ?? "",
                PlaceCountry: document["Country"] as? String ?? ""
                //PlacePostalCode: document["PostalCode"] as? Int ?? "",
                //PlaceLongitude: document["Longitude"] as? String ?? "",
                //PlaceLatitude: document["Latitude"] as? String ?? ""
                ))
                            
        }
        
        return places
    }
    
    static func buildOne(from document: DocumentSnapshot) -> appPlace {
        

        
        return appPlace(placeID: document.documentID,
                       data: document["taskdata"] as? String ?? "",
                      
        
    }
    
}
 */
