//
//  reqPostViewController.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 26/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class reqPostViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var postArr = [String:Post]()
    var cID:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cID)
        User.sharedUserIDRequest.value = []
        CompanyServices.postlistner(cID: self.cID!) { (error) in
            UserRequestServices.userRequestListnerForStudent(cID: self.cID!)
        }
        User.sharedUserIDRequest.asObservable().subscribe { (pID) in
            for k in pID.element!{
                self.postArr[k] =  User.posts.value[k]

            }
            self.table.reloadData()
        }
        
    }



}
extension reqPostViewController:UITableViewDelegate , UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! PostTableViewCell
        cell.title.text = Array(postArr.values)[indexPath.row].title
        cell.desc.text = Array(postArr.values)[indexPath.row].description
        cell.salary.text = "\(Array(postArr.values)[indexPath.row].salary!)"
        cell.tech.text = Array(postArr.values)[indexPath.row].technology
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(postArr.values).count
    }
}
