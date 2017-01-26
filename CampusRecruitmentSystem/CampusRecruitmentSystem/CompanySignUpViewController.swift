//
//  CompanySignUpViewController.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 26/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class CompanySignUpViewController: UIViewController {
    @IBOutlet weak var comapnyName: TTextField!
    @IBOutlet weak var companyEmial: TTextField!
    @IBOutlet weak var comapanyNo: TTextField!
    @IBOutlet weak var details: TTextField!
    @IBOutlet weak var ownerName: TTextField!
    @IBOutlet weak var ownerEmail: TTextField!
    @IBOutlet weak var ownerMobileNo: TTextField!
    @IBOutlet weak var password: TTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signUp(_ sender: Any) {
        
        let company = Company(compmanyName: self.comapnyName.text!, companyEmail: self.companyEmial.text!, companyNo: Int(self.comapanyNo.text!)!, detail: self.details.text!, name: self.ownerName.text!, email: self.ownerEmail.text!, password: self.password.text!, mobileNo: self.ownerMobileNo.text!, userType: .company)
        indicatorStart()
        AuthServices.signUp(userObject: company) { (error) in
            if error == nil{
                self.navigationController?.popViewController(animated: true)
            }else{
                ErrorAlert(message: error!)
            }
            indicatorStop()
        }
    }


}
