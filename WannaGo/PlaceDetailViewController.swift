//
//  PlaceDetailViewController.swift
//  WannaGo
//
//  Created by Whitehouse, Jarret M on 11/10/21.
//

import UIKit
import Firebase
import GoogleSignIn

class PlaceDetailViewController: UIViewController {
    
    // MARK: Attributes
    var placeID: String = ""
    var place: appPlace?
    private var service: PlaceService?
    
    // MARK: IBOutlets and Actions
    @IBOutlet var lblTaskData: UILabel!
    @IBOutlet var lblDueDate: UILabel!
    @IBOutlet var switchCompleted: UISwitch!
        
        // Get a reference to our Firestore document
        let placeRef: DocumentReference? = db.collection("places").document(self.placeID)
            placeRef?.updateData(["completed": completed]) { err in
            if let error = err {
                print("Error updating document: \(error)")
            } else {
                print("Document \(placeRef!.documentID) updated!")
            }
        }
        
        // Dismiss this view
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    
    // MARK: Custom methods
    func loadData() {
        service = PlaceService()
        
        var collection = ""
        if let user = GIDSignIn.sharedInstance.currentUser {
            collection = user.userID!
        }
        
        service?.getOne(collectionID: collection, taskID: taskID) { task in
            self.place = place
            self.lblTaskData.text = self.task?.taskdata
            
            
        }
    }
    
    
    // MARK: Lifecycle functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(placeID)
        loadData()
    }
    
}

