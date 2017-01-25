//
//  UserType.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 25/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import ObjectMapper

enum UserType:Int{
    case student,admin,company
}

let transformIntoUserType = TransformOf<UserType, Int>(fromJSON: { (value: Int?) -> UserType? in
    // transform value from String? to Int?
    return UserType(rawValue: value!)
}, toJSON: { (value: UserType?) -> Int? in
    // transform value from Int? to String?
    if let value = value {
        return value.rawValue

    }
    return nil
})
