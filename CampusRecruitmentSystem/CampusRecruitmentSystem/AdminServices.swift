//
//  AdminServices.swift
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

class AdminServices {
    
    static var ref: FIRDatabaseReference! = FIRDatabase.database().reference()
    
    static func deletePost(cID:String,postID:String,ownerCompanyID:String){
        
        let multiPath:[String:Any?] = ["company-Post/\(cID)/\(postID)":nil , "company/\(ownerCompanyID)/\(cID)/posts/\(postID)":nil]
        self.ref.updateChildValues(multiPath) { (error, rfrence) in
            print(error)
            print(rfrence)
        }
    }
}
