//
//  StudentSignUpViewController.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 25/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import FirebaseAuth

class StudentSignUpViewController: UIViewController {

    @IBOutlet weak var email: TTextField!
    @IBOutlet weak var password: TTextField!
    @IBOutlet weak var name: TTextField!
    @IBOutlet weak var rollNo: TTextField!
    @IBOutlet weak var mobileNo: TTextField!
    @IBOutlet weak var cgpa: TTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signup(_ sender: Any) {
        

        let company = Company(compmanyName: "Panacloud", companyEmail: "panacloud@gmail.com", companyNo: 12331, detail: "software comany", name: "zubair", email: "zubair@gmail.com", password: "123456", mobileNo: "1233434432", userType: .company)
        
        AuthServices.signUp(userObject: company) { (error) in
            print(error)
        }
        
        let stu = Student(rollNo: "b11101110", cgpa: "3.2", year: 2015, courseName: "BSCS", name: "zubair", email: "zubairghori93@gmail.com", password: "123456", mobileNo: "03132635297", userType: .student)
        
        AuthServices.signUp(userObject:stu) { (error) in
            print(error)
        }
    }

}
