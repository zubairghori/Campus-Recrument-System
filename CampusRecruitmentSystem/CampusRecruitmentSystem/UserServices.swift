//
//  UserServices.swift
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


class UserServices {
    static var ref: FIRDatabaseReference! = FIRDatabase.database().reference()

    
    static func listnerForStudent(){
        rxStudents()
            .flatMap({ (user) -> Observable<Student> in
                return rxStudentsAcedemics(user:user)
            })
            .subscribe { (user) in
                User.sharedStudents.value = [user.element!.userID!:user.element!]
        }
    }
    
    static func rxStudents()->Observable<User>{
        
        return Observable.create { observer in
            self.ref.child("users").queryOrdered(byChild: "userType").queryEqual(toValue: 0).observe(.childAdded, with: { (student) in
                let stu = Mapper<User>().map(JSONObject: student.value!)
                    stu!.userID = student.key
                observer.onNext(stu!)
            })
            return Disposables.create {}
        }
    }

    
    static func rxStudentsAcedemics(user:User)->Observable<Student>{
        return Observable.create { observer in
            self.ref.child("acedemics/\(user.userID!)").observe(.value, with: { (data) in
                let stu = user + Mapper<Student>().map(JSONObject: data.value!)!
                observer.onNext(stu)
            })
            return Disposables.create {}
        }
    }

}


