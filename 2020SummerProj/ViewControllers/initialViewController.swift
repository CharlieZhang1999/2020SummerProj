//
//  initialViewController.swift
//  2020SummerProj
//
//  Created by Ted on 5/19/20.
//  Copyright © 2020 香槟最靓的仔. All rights reserved.
//

import UIKit
import AVKit
import Firebase

class initialViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    
    @IBOutlet weak var loginBT0: UIButton!
    @IBOutlet weak var signupBT0: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        backgroundDisplay()
    }
    
    
    func configure() {
        Utilities.styleHollowButton(loginBT0)
        Utilities.styleHollowButton(signupBT0)
    }
    
    func backgroundDisplay() {
        
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "video", ofType: "mp4")
        guard bundlePath != nil else {
            return
        }
        
        // Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        // Create the video player item
        let item = AVPlayerItem(url: url)
        
        // Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(
            x: -50,
            y: 0,
            width: self.view.frame.size.width * 4,
            height: self.view.frame.size.height
        )
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
    
        // Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 1)
        
        
    }
}
