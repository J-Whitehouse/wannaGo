//
//  PlaceService.swift
//  WannaGo
//
//  Created by Whitehouse, Jarret M on 11/8/21.
//

/*
import Foundation
import Firebase

class PlaceService {
    let database = Firestore.firestore()
    
    func get(collectionID: String, handler: @escaping ([appPlace]) -> Void) {
        database.collection(collectionID)
            .addSnapshotListener {
                querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(appPlace.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
    
    func getOne(collectionID: String, taskID: String, handler: @escaping (appPlace) -> Void) {
        database.collection(collectionID).document(taskID).addSnapshotListener { documentSnapshot, err in
            if let error = err {
                print(error)
            } else {
                handler(appPlace.buildOne(from: documentSnapshot!))
            }
        }
    }
    
}

 */
