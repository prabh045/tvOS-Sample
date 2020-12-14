//
//  ViewController.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 10/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickAction(_ sender: Any) {
       // let tableVc = HomeViewController()
       // self.navigationController?.pushViewController(tableVc, animated: true)
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let storyVc = (story.instantiateViewController(identifier: "storyVc") as? StoryViewController)!
        self.navigationController?.pushViewController(storyVc, animated: true)
        
////                guard let url = URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4") else { return }
////                let playerLayer: AVPlayerLayer?
////                let trailerPlayer = AVPlayer(url: url)
////                playerLayer = AVPlayerLayer(player: trailerPlayer)
////                playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
////
////                playerLayer?.frame = self.view.bounds
////                self.view.layer.addSublayer(playerLayer!)
////                trailerPlayer.play()
//
//        let videoURL = URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")
//        let asset = AVAsset(url: videoURL!)
//        let item = AVPlayerItem(asset: asset)
//        let player = AVPlayer(playerItem: item)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        self.present(playerViewController, animated: true) {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                playerViewController.player!.play()
//            }
//        }
        
    }
    
    @IBAction func parisAction(_ sender: UIButton) {
        showAlert(status: "Correct!", title: "Congo you are a genius!")
    }
    
    @IBAction func lyonAction(_ sender: UIButton) {
        showAlert(status: "Wrong!", title: "You got it wrong! Try Again!")
    }
    
    @IBAction func cannesAction(_ sender: UIButton) {
        showAlert(status: "Wrong!", title: "You got it wrong! Try Again!")
    }
    
    @IBAction func nantesAction(_ sender: UIButton) {
       showAlert(status: "Wrong!", title: "You got it wrong! Try Again!")
    }
    
    
    func showAlert(status: String, title:String) {
        let alertController = UIAlertController(title: status, message: title, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

