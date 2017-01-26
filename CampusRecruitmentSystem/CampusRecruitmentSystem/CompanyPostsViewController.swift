//
//  CompanyPostsViewController.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 26/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class CompanyPostsViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
  
    var postID:String?
    var postArr = [String:Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CompanyServices.postlistner(cID: self.postID!) { (error) in
           
            
            
            self.table.reloadData()
        }
        
        User.posts.asObservable().subscribe { (posts) in
            self.postArr = posts.element!
            self.table.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "COMPINIES REQUESTED"
        
    }

}
extension CompanyPostsViewController:UITableViewDelegate , UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! PostTableViewCell
        cell.title.text = Array(postArr.values)[indexPath.row].title
        cell.desc.text = Array(postArr.values)[indexPath.row].description
        cell.salary.text = "\(Array(postArr.values)[indexPath.row].salary!)"
        cell.tech.text = Array(postArr.values)[indexPath.row].technology
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indicatorStart()
            UserRequestServices.applyForPost(uID: User.sharedUser.value!.userID!, cID: self.postID!, pID: Array(postArr.keys)[indexPath.row], completion: { (error) in
                if error == nil{
                    ErrorAlert(title: "Message!", message: "Your request sent to company!")
                }else{
                    ErrorAlert(message: error!)
                }
                indicatorStop()
            })
    }
    
}
