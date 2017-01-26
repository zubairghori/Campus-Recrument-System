//
//  User.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 25/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import RxSwift
import ObjectMapper

class User:Mappable{
    
    var name:String?
    var email:String?
    var password:String?
    var mobileNo:String?
    var userType:UserType?
    var userID:String?
    
    static var sharedUser = Variable<User?>(nil)
    static var posts = Variable<[String:Post]?>(nil)
    static var sharedStudents = Variable<[String:Student]>([:])
    static var sharedCompanies = Variable<[String:Company]>([:])
    static var sharedUserIDRequest = Variable<[String]>([])
    static var sharedComapyIDRequest = Variable<[String]>([])

    init(name:String,email:String,password:String,mobileNo:String,userType:UserType) {
        self.name = name
        self.email = email
        self.password = password
        self.mobileNo = mobileNo
        self.userType = userType
    }
    func mapping(map: Map) {
        self.name <- map["userName"]
        self.email <- map["emial"]
        self.password <- map["password"]
        self.mobileNo <- map["mobileNo"]
        self.userType <- (map["userType"],transformIntoUserType)

    }
    public required init(map: Map) {    }

}

func +(user:User,student:Student)->Student{
    let stu = student
    stu.name = user.name
    stu.email = user.email
    stu.userType = user.userType
    stu.mobileNo = user.mobileNo
    stu.userID = user.userID
    return stu
}
func +(user:User,company:Company)->Company{
    let company = company
    company.name = user.name
    company.email = user.email
    company.userType = user.userType
    company.mobileNo = user.mobileNo
    company.userID = user.userID
    return company
}
