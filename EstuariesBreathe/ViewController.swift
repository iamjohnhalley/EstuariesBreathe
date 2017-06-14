//
//  ViewController.swift
//  EstuariesBreathe
//
//  Created by John Halley on 10/06/2017.
//  Copyright © 2017 John Halley. All rights reserved.
//

import UIKit

//var
struct MyVariables {
    static var yourVariable = 0
    static var myInt = 0
    static var myFix = 0
    static var x = 0
}

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
 
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        btnMenuButton.target = revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func respondToGesture(gesture : UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("Right Swipe")
            Show_Menu()
            
            
        case UISwipeGestureRecognizerDirection.left:
            print("Left Swipe")
            
            
            
        default:
            break
            
            
        }
        
    }
    
    func Show_Menu() {
        self.revealViewController().panGestureRecognizer()
        

        
    }

   
    override func viewWillAppear(_ animated: Bool) {
        

    
//        if let x = UserDefaults.standard.value(forKey: "sessionCount")
//        {
//        
//       // MyVariables.myInt = UserDefaults.standard.value(forKey: "sessionCount") as! Int
//        let addAnother :String = String(describing: x)
//        sessionCount.text = addAnother as String!
//        print(MyVariables.yourVariable)
//      
//            
//        }

    }

}

