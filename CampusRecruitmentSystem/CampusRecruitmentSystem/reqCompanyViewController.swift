//
//  reqCompanyViewController.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 26/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class reqCompanyViewController: UIViewController {
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        User.sharedCompanies.asObservable().subscribe { (posts) in
            self.table.reloadData()
        }
    }

  

}
extension reqCompanyViewController:UITableViewDelegate , UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! CompanyCellViewController
        cell.cname.text = Array(User.sharedCompanies.value)[indexPath.row].value.compmanyName
        cell.cemail.text = Array(User.sharedCompanies.value)[indexPath.row].value.detail
        cell.cno.text = "\(Array(User.sharedCompanies.value)[indexPath.row].value.companyNo!)"
        cell.details.text = Array(User.sharedCompanies.value)[indexPath.row].value.detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.sharedCompanies.value.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id  = Array(User.sharedCompanies.value)[indexPath.row].value.companyId
        performSegue(withIdentifier: "posts", sender: id)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? reqPostViewController
        dest?.cID = sender as? String
    }
    
    
}
