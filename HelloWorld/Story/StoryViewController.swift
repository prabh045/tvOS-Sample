//
//  StoryViewController.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 14/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "StoryTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: StoryTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension StoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let storyCell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier, for: indexPath) as? StoryTableViewCell else {
            fatalError("couldnt initialse cell")
        }
        return storyCell
    }
}
