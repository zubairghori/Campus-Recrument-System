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
    @IBOutlet weak var year: TTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signup(_ sender: Any) {

        
        let stu = Student(rollNo: self.rollNo.text!, cgpa: self.cgpa.text!, year: Int(self.year.text!)! , courseName: "BSCS", name: self.name.text!, email: self.email.text!, password: self.password.text!  , mobileNo: self.mobileNo.text!, userType: .student)
        indicatorStart()
        AuthServices.signUp(userObject:stu) { (error) in

            if error == nil{
                self.navigationController?.popViewController(animated: true)
            }else{
                ErrorAlert(message: error!)
            }
            indicatorStop()

        }
        
        
        
    }
    
    

}
