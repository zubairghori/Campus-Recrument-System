//
//  Constant.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 26/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import MBProgressHUD

let firebaseTimeStamp = [".sv":"timestamp"]

func ErrorAlert(title: String = "Error", message: String){
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(dismissAction)
    UIApplication.shared.keyWindow?.topMostController()!.present(alertController, animated: true, completion: nil)
}
let ind = MBProgressHUD.showAdded(to:  UIApplication.shared.keyWindow!, animated: true)


func indicatorStart(){
    ind.show(animated: true)
}

func indicatorStop(){
    ind.hide(animated: true)
}
