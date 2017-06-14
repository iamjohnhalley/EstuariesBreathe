//
//  MenuViewController.swift
//  EstuariesBreathe
//
//  Created by John Halley on 10/06/2017.
//  Copyright © 2017 John Halley. All rights reserved.
//

import UIKit
import MessageUI
import Social

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    //outlets
    @IBOutlet weak var tableView: UITableView!
    
    //var
    var menuNameArr:Array = [String]()
    var iconImage:Array = [UIImage]()
    var shareText = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuNameArr = ["Breathe", "About us", "Share", "Rate us", "Feedback", "Contact"]
        iconImage = [UIImage(named: "breathe")!, UIImage(named: "about")!, UIImage(named: "share")!, UIImage(named: "rate")!,UIImage(named: "feedback")!, UIImage(named: "contact")!]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        
        cell.imageIcon.image = iconImage[indexPath.row]
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
        
        if cell.labelName.text! == "Share" {
            
            shareText.text = "Check out this really cool app Estuaries"
            let activityVC = UIActivityViewController(activityItems: [self.shareText.text!], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            
            
            self.present(activityVC, animated:  true, completion: nil)
            
            
            
            
        }
        
        if cell.labelName.text! == "Rate us" {
            
            
            let alertController = UIAlertController(title: "Rate Us!", message: "\nAre you enjoying our app? Please rate us in the app store!\n\nAlso if you know of ways we can make our app better, please send us feedback so we can improve the experience for you!\n\nThanks!\nCollege Calm Team", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Rate on iTunes", style: .default, handler: { (action: UIAlertAction!) in
                print("RateUs.RateUs_Tapped")
                print("Send to iTunes")
            }))
            
            alertController.addAction(UIAlertAction(title: "Send Us Feedback", style: .default, handler: { (action: UIAlertAction!) in
                print("RateUs.Feedback_Tapped")
                let mailComposeViewController = self.configuredMailComposeViewController()
                if MFMailComposeViewController.canSendMail() {
                    self.present(mailComposeViewController, animated: true, completion: nil)
                } else {
                    self.showSendEmailErrorAlert()
                }
            }))
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
                print("RateUs.Cancel_Tapped")
            }))
            
            present(alertController, animated: true, completion: nil)
            
        }
    
    
        

    
    
        if cell.labelName.text! == "Feedback" || cell.labelName.text! == "Contact"{
    
        let mailComposeViewController = configuredMailComposeViewController()
    
        if MFMailComposeViewController.canSendMail() {
        self.present(mailComposeViewController, animated: true, completion: nil)
    
        } else {
        self.showSendEmailErrorAlert()
    }
    
   }
    
}


        func configuredMailComposeViewController() -> MFMailComposeViewController {
            
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self
            
            mailComposerVC.setToRecipients(["your@email.com"])
            mailComposerVC.setSubject("App Feedback")
            mailComposerVC.setMessageBody("Hi Team!\n\nI Would like to share the following feedback..\n", isHTML: false)
            
            return mailComposerVC
            
        }


        func showSendEmailErrorAlert() {
    
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send email. Please check email configureation and try again.", delegate: self, cancelButtonTitle: "Ok")
        sendMailErrorAlert.show()
    }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    
    
            self.dismiss(animated: true, completion: nil)
    }

    
}

