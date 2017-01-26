//
//  ViewController.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 25/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password: TTextField!
    @IBOutlet weak var email: TTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
  
        indicatorStart()
        AuthServices.signIn(email: self.email.text!, password: "123456") { (user, error) in
            if error == nil{
                if let stu = user as? Student{
                    self.performSegue(withIdentifier: "createPost", sender: nil)
                    
                }
                else if let com = user as? Company{
                    self.performSegue(withIdentifier: "company", sender: nil)
                    
                }else {
                    
                }
            }else{
                ErrorAlert(message: error!)
            }
            indicatorStop()
        }
        
//        User.sharedCompanies.asObservable().subscribe { (companies) in
//            print(companies)
//        }
//        User.sharedUser.asObservable().subscribe { (user) in
//            let com = user as? Company
//            print(com?.compmanyName)
//        }
        
//        User.sharedStudents.asObservable().subscribe { (stuArr) in
//            print(stuArr)
//        }
//
    }

    @IBAction func tap(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func signup(_ sender: Any) {
        
    }
}

extension ViewController:UITextFieldDelegate{
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
