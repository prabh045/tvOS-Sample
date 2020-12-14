//
//  WeatherViewController.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 10/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let tempLabel:UILabel = {
        let label = UILabel()
        label.textColor = .systemPurple
        label.font = UIFont.italicSystemFont(ofSize: 60)
        label.text = "Temperature Here"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let summaryLabel:UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Summary Here"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tempLabel)
        self.view.addSubview(summaryLabel)
        setConstarints()
        getData()
    }
    
    func setConstarints() {
        tempLabel.frame = CGRect(x: 100, y: 100, width: 500, height: 200)
        summaryLabel.frame = CGRect(x: 100, y: 300, width: 500, height: 100)
    }
    
    func getData() {
        guard let url = URL(string: "https://api.forecast.io/forecast/d3250bf407f0579c8355cd39cdd4f9e1/37.7833,122.4167") else { return }
        
        guard let data = try? Data(contentsOf: url) else { return }
        
        do {
            let parsedData = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            let dict = parsedData as? [String:AnyObject]
            print(dict!["currently"]!["summary"])
            print("Parsed Data is \(parsedData)")
            
            print("Dict is \(dict)")
            
            self.tempLabel.text = "\(dict!["currently"]!["temperature"]!!)"
            self.summaryLabel.text = "\(dict!["currently"]!["summary"]!!)"
            
        } catch let error {
            print("Error occured while parsing data \(error.localizedDescription)")
        }
        
        
    }

}
