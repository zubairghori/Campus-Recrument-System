//
//  UserRequestServices.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 26/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import ObjectMapper
import RxSwift

class UserRequestServices {
    static var ref: FIRDatabaseReference! = FIRDatabase.database().reference()

    static func applyForPost(uID:String,cID:String,pID:String,completion:@escaping (_ eror:String?)->Void){
        
        let mulitPath:[String:Any] = ["user-Company-Request/\(uID)/\(cID)/\(pID)":firebaseTimeStamp , "comapanies-User-Request/\(cID)/\(pID)/\(uID)":firebaseTimeStamp]
        self.ref.updateChildValues(mulitPath) { (error, refrence) in
            if error == nil{
                completion(nil)
            }else{
                completion(error!.localizedDescription)
            }
        }
    }
    
    
    static func userRequestListnerForCompany(cID:String,pID:String){
        self.ref.child("comapanies-User-Request/\(cID)/\(pID)").observe(.childAdded, with: { (userID) in
            User.sharedComapyIDRequest.value.append(userID.key)
        })
    }
    
    static func userRequestListnerForStudent(cID:String){
        self.ref.child("user-Company-Request/\(User.sharedUser.value!.userID!)/\(cID)").observe(.childAdded, with: { (userID) in
            User.sharedUserIDRequest.value.append(userID.key)
        })
    }
}
