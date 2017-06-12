//
//  BreatheViewController.swift
//  CollegeMindFYP
//
//  Created by John on 10/02/2017.
//  Copyright © 2017 John. All rights reserved.


import UIKit
import Lottie
import AVFoundation


var breathetimer:Timer = Timer()
var breathingSession: String!
var myString: String!


    var audioPlayer = AVAudioPlayer()

class CircleViewController: UIViewController {
    

    
   // @IBOutlet weak var breatheTimeLabel: UILabel!

    override func viewWillDisappear(_ animated: Bool) {
   
      
            //player?.stop()
    }
    
        
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
               
       // let url = Bundle.main.url(forResource: "6", withExtension: "mp3")!
        
        //refernce the database

        
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
    
    

   
     
        let animationView = LOTAnimationView(name: "CircleV6")
        animationView?.frame = CGRect(x: 0, y: 160, width: self.view.frame.size.width, height: 390)
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

