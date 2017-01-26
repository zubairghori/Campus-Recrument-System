//
//  CreatePostViewController.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 26/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {
    @IBOutlet weak var tile: TTextField!

    @IBOutlet weak var salary: TTextField!
    @IBOutlet weak var technology: TTextField!
    @IBOutlet weak var descriptionPost: TTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        User.posts.asObservable().subscribe { (posts) in
//            print(posts)
//        }
//        UserRequestServices.applyForPost(uID: User.sharedUser.value!.userID!, cID: "KbLdwk1PNXKbIlx6-8h", pID: "KbOL1ak0rdXSni0DGeZ"){_ in
//            
//        }
        
//        UserRequestServices.userRequestListnerForCompany(cID: "KbLdwk1PNXKbIlx6-8h", pID: "KbOL1ak0rdXSni0DGeZ")
//        UserRequestServices.userRequestListnerForStudent(cID: "KbLdwk1PNXKbIlx6-8h", pID: "KbOL1ak0rdXSni0DGeZ")
//        
//        User.sharedUserIDRequest.asObservable().subscribe { (arr) in
//            print("userReqID:\(arr.element)")
//        }
//        
//        User.sharedComapyIDRequest.asObservable().subscribe { (arr) in
//            print("comReqID\(arr.element)")
//        }
    }

    @IBAction func createPost(_ sender: Any) {
        if let company = User.sharedUser.value as? Company{
            let post = Post(title: "Senior iOS Developer", description: "2+ experience required", salary: 50000, technology: "Swift 3")
            let companyId = company.companyId!
            CompanyServices.createPost(cID: companyId, post: post, completion: { (error) in
                print(error)
            })
        }
    }
    
    
    
    
}
