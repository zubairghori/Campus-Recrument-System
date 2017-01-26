//
//  StudentsViewController.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 26/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        User.sharedStudents.asObservable().subscribe { (posts) in
            self.table.reloadData()
        }
    
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "STUDENTS"

    }

}

extension StudentsViewController:UITableViewDelegate , UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! StudentsTableViewCell
        cell.rollno.text = Array(User.sharedStudents.value)[indexPath.row].value.rollNo
        cell.courseName.text = Array(User.sharedStudents.value)[indexPath.row].value.name
        cell.year.text = "\(Array(User.sharedStudents.value)[indexPath.row].value.year!)"
        cell.gpa.text = Array(User.sharedStudents.value)[indexPath.row].value.cgpa
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.sharedStudents.value.count
    }
    
    
}
