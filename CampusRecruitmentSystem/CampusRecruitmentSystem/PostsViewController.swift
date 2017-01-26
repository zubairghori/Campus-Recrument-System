//
//  PostsViewController.swift
//  CampusRecruitmentSystem
//
//  Created by Admin on 26/01/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PostsViewController: UIViewController {
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let button1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.action))
        self.tabBarController?.navigationItem.rightBarButtonItem  = button1
        User.posts.asObservable().subscribe { (posts) in
            self.table.reloadData()
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "POSTS"
        
    }
    
    func action(){
        performSegue(withIdentifier: "add", sender: nil)
    }
}

extension PostsViewController:UITableViewDelegate , UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! PostTableViewCell
        cell.title.text = Array(User.posts.value)[indexPath.row].value.title
        cell.desc.text = Array(User.posts.value)[indexPath.row].value.description
        cell.salary.text = "\(Array(User.posts.value)[indexPath.row].value.salary!)"
        cell.tech.text = Array(User.posts.value)[indexPath.row].value.technology
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.posts.value.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if let compnay = User.sharedUser.value as? Company{
                indicatorStart()
                AdminServices.deletePost(cID: compnay.companyId!, postID:Array(User.posts.value.keys)[indexPath.row] , ownerCompanyID: compnay.userID!)
                indicatorStop()
            }

        }
    }
}
