//
//  ResourcePageViewController.swift
//  PHRLdemo
//
//  Created by Aki Zhou on 2018-09-16.
//  Copyright © 2018 Aki Zhou. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ResourcePageViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func PlayVideo()
    {
        if let path = Bundle.main.path(forResource: "Anger Management Techniques", ofType: "mp4")
        {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true)
            {
                video.play()
            }
            
        }
    }
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func Play(_ sender: Any) {
        player.play()
        
    }
    
    @IBAction func Stop(_ sender: Any) {
        player.stop()
    }
    
    override func viewDidLoad() {
        
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: [])
        do {
            let audioPlayer = Bundle.main.path(forResource: "A simple daily forgiveness exercise - Veronica Entwistle", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPlayer!)as URL)
            
            
        }
        catch{
            //ERROR
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "some_relaxing_photo")
        imageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

