//
//  Company.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 25/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import RxSwift
import ObjectMapper

class Company:User {

    var compmanyName:String?
    var companyEmail:String?
    var companyNo:Int?
    var detail:String?
    
    
    init(compmanyName:String,companyEmail:String,companyNo:Int,detail:String,name:String,email:String,password:String,mobileNo:String,userType:UserType) {
        self.compmanyName = compmanyName
        self.companyEmail = companyEmail
        self.companyNo = companyNo
        self.detail = detail
        super.init(name: name, email: email, password: password, mobileNo: mobileNo, userType: userType)
    }
    
    public required init(map: Map) {   super.init(map: map) }
    
    override func mapping(map: Map) {
        self.compmanyName <- map["compmanyName"]
        self.companyEmail <- map["companyEmail"]
        self.companyNo <- map["companyNo"]
        self.detail <- map["detail"]
    }


}
