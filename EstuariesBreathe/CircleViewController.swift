//
//  BreatheViewController.swift
//  CollegeMindFYP
//
//  Created by John on 10/02/2017.
//  Copyright © 2017 John. All rights reserved.


import UIKit
import Lottie
import AVFoundation




//var
var audioPlayer = AVAudioPlayer()

class CircleViewController: UIViewController {
    


  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "6", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
            var audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            }
                
            catch {
                
            }
        }
        catch{
            print(error)
        }
        
        
        
        
        
        let animationView = LOTAnimationView(name: "VersionOne")
        animationView?.frame = CGRect(x: 0, y: 120, width: self.view.frame.size.width, height: 390)
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopAnimation = true
        
        self.view.addSubview(animationView!)
        
        animationView?.play()
        

       

    }
    
    
    

    @IBAction func doneButton(_ sender: UIButton) {
    
        
        dismiss(animated: true, completion: nil)
        audioPlayer.stop()
        
 
        
    }
 
}

