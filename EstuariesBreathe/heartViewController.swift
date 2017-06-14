//
//  heartViewController.swift
//  EstuariesBreathe
//
//  Created by John Halley on 14/06/2017.
//  Copyright © 2017 John Halley. All rights reserved.
//

import UIKit
import Lottie
import AVFoundation

class heartViewController: UIViewController {

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
            
            
            
            
            
            let animationView = LOTAnimationView(name: "VersionTwo")
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

