//
//  CompanyServices.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 25/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import ObjectMapper
import RxSwift

class CompanyServices {
    static var ref: FIRDatabaseReference! = FIRDatabase.database().reference()

    static func createPost(cID:String,post:Post,completion:@escaping (_ error:String?)->Void){
        
        let post: [String:Any] = ["title":post.title,"description":post.description!,"salary":post.salary!,"technology":post.technology!]
        let postID = self.ref.childByAutoId().key
        
        let multiPath:[String:Any] = ["company-Post/\(cID)/\(postID)":post , "company/\(User.sharedUser.value!.userID!)/\(cID)/posts/\(postID)":firebaseTimeStamp]
        self.ref.updateChildValues(multiPath) { (error, refrence) in
            if error == nil{
                completion(nil)
            }else{
                completion(error!.localizedDescription)
            }
        }
    }
    
    static func postlistner(cID:String){
        self.ref.child("company-Post/\(cID)").observe(.childAdded, with: { (post) in
            let postObj = Mapper<Post>().map(JSONObject: post.value!)
            User.posts.value = [post.key:postObj!]
        })
        self.ref.child("company-Post/\(cID)").observe(.childRemoved, with: { (post) in
            User.posts.value?.removeValue(forKey: post.key)
        })
    }
    
    static func listnerForCompanies(){
        rxOwner()
            .flatMap({ (user) -> Observable<Company> in
                return rxOwnerCompany(user:user)
            })
            .subscribe { (user) in
                User.sharedCompanies.value = [user.element!.userID!:user.element!]
        }
    }
    
    static func rxOwner()->Observable<User>{
        
        return Observable.create { observer in
            self.ref.child("users").queryOrdered(byChild: "userType").queryEqual(toValue: 2).observe(.childAdded, with: { (student) in
                let stu = Mapper<User>().map(JSONObject: student.value!)
                stu!.userID = student.key
                observer.onNext(stu!)
            })
            return Disposables.create {}
        }
    }
    
    
    static func rxOwnerCompany(user:User)->Observable<Company>{
        return Observable.create { observer in
            self.ref.child("company/\(user.userID!)").observe(.childAdded, with: { (data) in
                let stu = user + Mapper<Company>().map(JSONObject: data.value!)!
                observer.onNext(stu)
            })
            return Disposables.create {}
        }
    }
    
}

