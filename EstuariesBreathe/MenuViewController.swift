//
//  MenuViewController.swift
//  EstuariesBreathe
//
//  Created by John Halley on 10/06/2017.
//  Copyright © 2017 John Halley. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //outlets
    @IBOutlet weak var tableView: UITableView!
    
    //var
    var menuNameArr:Array = [String]()
    //var iconImage:Array = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuNameArr = ["Breathe", "About us", "Share", "rate us", "Feedback", "Contact"]
       // iconImage = [UIImage(named: "breathe")!, UIImage(named: "about")!, UIImage(named: "share")!, UIImage(named: "rate")!,UIImage(named: "feedback")!, UIImage(named: "contact")!]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        
        //cell.imageIcon.image = iconImage[indexPath.row]
        cell.labelName.text! = menuNameArr[indexPath.row]
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        
        let revealViewcontroller:SWRevealViewController = self.revealViewController()
        
        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        print(cell.labelName.text!)
        
        if cell.labelName.text! == "Breathe" {
            
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontViewController = UINavigationController.init(rootViewController: desController)
            
            revealViewcontroller.pushFrontViewController(newFrontViewController, animated: true)
            print("Show new controller")
            
        }
        
        if cell.labelName.text! == "About us" {
            
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            revealViewcontroller.pushFrontViewController(newFrontViewController, animated: true)
            print("Show new controller")
        }
        
        else{
            print("nah")
        }

        }
    
    }

