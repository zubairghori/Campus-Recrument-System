//
//  Student.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 25/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import RxSwift
import ObjectMapper

class Student: User {
    public required init(map: Map) {   super.init(map: map) }

    var rollNo:String?
    var cgpa:String?
    var year:Int?
    var courseName:String?
    
    init(rollNo:String,cgpa:String,year:Int,courseName:String,name:String,email:String,password:String,mobileNo:String,userType:UserType) {
        self.rollNo = rollNo
        self.cgpa = cgpa
        self.year = year
        self.courseName = courseName
        super.init(name: name, email: email, password: password, mobileNo: mobileNo, userType: userType)
    }

    
    override func mapping(map: Map) {
        self.rollNo <- map["rollNo"]
        self.cgpa <- map["cgpa"]
        self.year <- map["year"]
        self.courseName <- map["courseName"]
    }
}
