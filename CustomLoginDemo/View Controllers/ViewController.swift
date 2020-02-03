//
//  ViewController.swift
//  CustomLoginDemo
//
//  Created by Christopher Ching on 2019-07-22.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Set up video in the background
        setUpVideo()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
        
    }
    
    func setUpVideo() {
         
         // Get the path to the resource in the bundle
         let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
         
         print ("step 1 success")
         
         guard bundlePath != nil else {
             return
         }
         print ("step 2 success")
         
         // Create a URL from it
         let url = URL(fileURLWithPath: bundlePath!)
         print ("step 3 success")
         // Create the video player item
         let item = AVPlayerItem(url: url)
         print ("step 4 success")
         // Create the player
         videoPlayer = AVPlayer(playerItem: item)
         print ("step 5 success")
         // Create the layer
         videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
         print ("step 6 success")
         // Adjust the size and frame
         videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
         
         view.layer.insertSublayer(videoPlayerLayer!, at: 0)
         
         // Add it to the view and play it
         videoPlayer?.playImmediately(atRate: 0.3)
         print ("step 7 success")
     }


}

