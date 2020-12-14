//
//  TableViewPracticeController.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 10/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class TableViewPracticeController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArray = ["Paris", "Cannes", "Lyon", "Nice", "Nantes", "Amiens","Arles","Annecy","Dunkirk"]
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = dataArray[indexPath.row]
        cell?.detailTextLabel?.text = "Love from \(dataArray[indexPath.row])"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("called")
        let vc = DemoUIController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
