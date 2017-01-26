//
//  Post.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 25/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import ObjectMapper

class Post: Mappable {
   
    public required init(map: Map) {    }

    var title:String?
    var description:String?
    var salary:Int?
    var technology:String?
    var postID:String?
    
    func mapping(map: Map) {
        self.title <- map["title"]
        self.description <- map["description"]
        self.salary <- map["salary"]
        self.technology <- map["technology"]
    }
    
    init(title:String,description:String,salary:Int,technology:String) {
        self.title = title
        self.description = description
        self.salary = salary
        self.technology = technology
    }
    
}
