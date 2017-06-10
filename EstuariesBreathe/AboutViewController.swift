//
//  AboutViewController.swift
//  EstuariesBreathe
//
//  Created by John Halley on 10/06/2017.
//  Copyright © 2017 John Halley. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btnMenuButton.target = revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))

        
    }

 
}

