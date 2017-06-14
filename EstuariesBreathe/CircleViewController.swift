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
    

    @IBOutlet weak var breatheTimeLabel: UILabel!
    
    //var timer
    var time = 0
    var timer = Timer()
    public var totalTime = String()


  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ( MyVariables.yourVariable > 0) {
        MyVariables.yourVariable = UserDefaults.standard.value(forKey: "sessionCount") as! Int
        } else {
            print("no")
        }
        
       //start timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CircleViewController.action), userInfo: nil, repeats: true)

        
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
    
    

   
     
        let animationView = LOTAnimationView(name: "v3")
        animationView?.frame = CGRect(x: 0, y: 120, width: self.view.frame.size.width, height: 390)
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopAnimation = true
        
        self.view.addSubview(animationView!)
        
        animationView?.play()
      
       

    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
    
     
    }

    

    @IBAction func doneButton(_ sender: UIButton) {
    
        
        dismiss(animated: true, completion: nil)
        audioPlayer.stop()
        
        
        //stop timer
        timer.invalidate()
        
        
        
        
            // add 1 to session counter if timer is over 19 secs
        
            MyVariables.yourVariable += 1
            let token = MyVariables.yourVariable
            UserDefaults.standard.set(token, forKey: "sessionCount")
        }
    

        //timer
        func action() {
        
        time += 1
        breatheTimeLabel.text = String(time)
        
       
        
    }
    
    


}

