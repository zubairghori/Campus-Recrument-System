//
//  stuReqViewController.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 26/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class stuReqViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    var users = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        User.sharedUserIDRequest.asObservable().subscribe { (posts) in
            for p in posts.element!{
                self.users.append(User.sharedStudents.value[p]!)
            }
            self.table.reloadData()
        }
    }

    

}
extension stuReqViewController:UITableViewDelegate , UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! StudentsTableViewCell
        cell.rollno.text = users[indexPath.row].rollNo
        cell.courseName.text = users[indexPath.row].name
        cell.year.text = "\(users[indexPath.row].year!)"
        cell.gpa.text = users[indexPath.row].cgpa
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
}
