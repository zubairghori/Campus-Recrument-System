//
//  AuthServices.swift
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

class AuthServices {
  
    static var ref: FIRDatabaseReference! = FIRDatabase.database().reference()
    
    static func signUp(userObject:Company,comletion:@escaping (_ error:String?)->Void){
        FIRAuth.auth()?.createUser(withEmail: userObject.email!, password: userObject.password!) { (user, error) in
            if error == nil{
                let userDic:[String : Any] = ["userName":userObject.name,"emial":userObject.email!,"mobileNo":userObject.mobileNo!,"userType":userObject.userType!.hashValue]
                let companyDic:[String : Any] = ["companyEmail":userObject.companyEmail,"compmanyName":userObject.compmanyName!,"companyNo":userObject.companyNo!,"detail":userObject.detail]
                
                let multiPath: [String:Any]  =
                    ["users/\(user!.uid)" : userDic , "company/\(user!.uid)/\(self.ref.childByAutoId().key)":companyDic]
                
                self.ref.updateChildValues(multiPath, withCompletionBlock: { (error, refrence) in
                    if error == nil{
                        comletion(nil)
                        User.sharedUser.value?.userID = FIRAuth.auth()?.currentUser?.uid
                        User.sharedUser.value = userObject
                    }else{
                        comletion(error!.localizedDescription)
                        
                    }
                })
            }else{
                comletion(error!.localizedDescription)
            }
            
        }
    }
    
    
    static func signUp(userObject:Student,comletion:@escaping (_ error:String?)->Void){
        FIRAuth.auth()?.createUser(withEmail: userObject.email!, password: userObject.password!) { (user, error) in
            if error == nil{
                let userDic:[String : Any] = ["userName":userObject.name,"emial":userObject.email!,"mobileNo":userObject.mobileNo!,"userType":userObject.userType!.hashValue]
                
                let acedemics: [String:Any] = ["rollNo":userObject.rollNo!,"cgpa":userObject.cgpa!,"year":userObject.year!,"courseName":userObject.courseName!]
                let multiPath: [String:Any]  =
                    ["users/\(user!.uid)" : userDic , "acedemics/\(user!.uid)":acedemics]
                
                self.ref.updateChildValues(multiPath, withCompletionBlock: { (error, refrence) in
                    if error == nil{
                        comletion(nil)
                        User.sharedUser.value?.userID = FIRAuth.auth()?.currentUser?.uid
                        User.sharedUser.value = userObject
                    }else{
                        comletion(error!.localizedDescription)
                        
                    }
                })
            
            }else{
                comletion(error!.localizedDescription)
            }
            
        }
    }
    
    
    
    
    static func signIn(email:String, password:String, completion:@escaping (_ user:User? , _ error:String?)->Void){
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            if error == nil{
                self.ref.child("users/\(user!.uid)").observeSingleEvent(of: .value, with: { (data) in
                    if data.exists(){
                        let userObj = Mapper<User>().map(JSONObject: data.value!)
                        switch userObj!.userType!{
                        case .student:
                            self.ref.child("acedemics/\(user!.uid)").observeSingleEvent(of: .value, with: { (student) in
                                let stu = userObj! + Mapper<Student>().map(JSONObject: student.value!)!
                                User.sharedUser.value = stu
                                User.sharedUser.value?.userID = FIRAuth.auth()?.currentUser?.uid
                                CompanyServices.listnerForCompanies()
                                completion(stu, nil)
                            })
                        case .company:
                            self.ref.child("company/\(user!.uid)").observeSingleEvent(of: .value, with: { (company) in
                                let obj = company.value as? [String:Any]
                                let comId = Array(obj!.keys)[0]
                                let comObj = Array(obj!.values)[0]
                                let com = userObj! + Mapper<Company>().map(JSONObject: comObj)!
                                com.companyId = comId
                                User.sharedUser.value = com
                                User.sharedUser.value?.userID = FIRAuth.auth()?.currentUser?.uid
                                CompanyServices.postlistner(cID: comId)
                                UserServices.listnerForStudent()
                                
                                completion(com, nil)
                            })
                        case .admin:
//                            User.sharedUser.value = Admin
                            completion(userObj, nil)
                        }
                    }
                })
            }else{
                completion(nil, error!.localizedDescription)
            }
        }
    }
    
}




