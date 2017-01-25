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
  
        AuthServices.signIn(email: "zubair@gmail.com", password: "123456") { (user, error) in
           
            if let stu = user as? Student{
                print(stu.cgpa)
            }
            else if let com = user as? Company{
                print(com.compmanyName)
            }else {
                
            }
            
        }
        
//        User.sharedUser.asObservable().subscribe { (user) in
//            let com = user as? Company
//            print(com?.compmanyName)
//        }
        
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
