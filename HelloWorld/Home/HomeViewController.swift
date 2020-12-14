//
//  HomeViewController.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 14/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var sectionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
      //  tableView.rowHeight = 200
       // tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(sectionsTableView)
        setupconstraints()
    }
        
    func setupconstraints() {
          let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            sectionsTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            sectionsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            sectionsTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            sectionsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let homeCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            fatalError("couldnt initialse cell")
        }
        return homeCell
    }
}
