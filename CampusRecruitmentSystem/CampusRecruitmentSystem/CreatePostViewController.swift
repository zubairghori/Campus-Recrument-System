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
        
//        AdminServices.deletePost(cID: "-KbOjoOD6Ts4sa74Wj0A", postID: "-KbOkMMFA4thEjAMbpJl", ownerCompanyID: "fYez4wJft5aqnEWViK0PQ5r9S9n2")
        
//        let stu = Student(rollNo: "b11108810", cgpa: "3.2", year: 2020, courseName: "BCSE", name: "zubair waqar", email: "waqar@gmail.com", password: "123456", mobileNo: "03132635297", userType: .student)
//
//        UserServices.updateUserProfile(userObject: stu) { (error) in
//            print(error)
//        }
        
    }

    @IBAction func createPost(_ sender: Any) {
        
        if let company = User.sharedUser.value as? Company{
            let post = Post(title: "Most Senior iOS Developer", description: "2+ experience required", salary: 50000, technology: "Swift 3")
            let companyId = company.companyId!
//            CompanyServices.createPost(cID: companyId, post: post, completion: { (error) in
//                print(error)
//            })
//            
//            CompanyServices.updatePost(cID: "-KbOjoOD6Ts4sa74Wj0A", pID: "-KbOkOMy96vqy3CA1als", post: post, completion: { (error) in
//                
//            })
        }
    }
    
    
    
    
}
