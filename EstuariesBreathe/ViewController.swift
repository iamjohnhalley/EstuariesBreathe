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
    @IBOutlet weak var sessionCount: UILabel!
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        btnMenuButton.target = revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
    }

   
    override func viewWillAppear(_ animated: Bool) {
        

    
        if let x = UserDefaults.standard.value(forKey: "sessionCount")
        {
        
       // MyVariables.myInt = UserDefaults.standard.value(forKey: "sessionCount") as! Int
        let addAnother :String = String(describing: x)
        sessionCount.text = addAnother as String!
        print(MyVariables.yourVariable)
      
            
        }

    }

}

