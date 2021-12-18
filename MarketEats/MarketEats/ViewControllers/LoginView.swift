//
//  LoginView.swift
//  MarketEats
//
//  Created by Alexis Powell on 12/17/21.
//

import UIKit

class LoginView: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //login button
    @IBAction func isPressed(_ sender: UIButton) {
        /*
         validate if password is accurate
         validate if email is accurate
         
         if email does not exist then reroute to register.
         if password is forgotten then forget password
         
         if successful, login into home screen
         */
        
        if (((emailText.text?.isEmpty) != nil) || ((passwordText.text?.isEmpty) != nil)) {
            let alert = UIAlertController.init(title: "Login Error" , message: "Please fill the entire form", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style:.default))
            self.present(alert ,animated: true, completion: nil)
        }
        /*
        else if(password is not in database or accurate){
             let alert = UIAlertController.init(title: "Password Error" , message: "Password Incorrect", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title:"OK", style:.default))
             self.present(alert ,animated: true, completion: nil)
        }
         
         else if(password is not in database or accurate){
              let alert = UIAlertController.init(title: "Email Error" , message: "Email Incorrect", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title:"OK", style:.default))
              self.present(alert ,animated: true, completion: nil)
         }
        */

    }
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        //provide code for forget password
    }
    
}


/* OPTIONAL FEATURE
 //passwordless authentication
 let actionCodeSettings = ActionCodeSettings()
 actionCodeSettings.url = URL(string: "marketeats-a6fe5.firebaseapp.com")
 
 // The sign-in operation has to always be completed in the app.
 actionCodeSettings.handleCodeInApp = true
 actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
 actionCodeSettings.setAndroidPackageName("com.alexispowell.MarketEats",
                                          installIfNotAvailable: false, minimumVersion: "12")
 
 //sending authorization link
 Auth.auth().sendSignInLink(toEmail: email,
                            actionCodeSettings: actionCodeSettings) { error in
   // ...
     if let error = error {
       self.showMessagePrompt(error.localizedDescription)
       return
     }
     // The link was successfully sent. Inform the user.
     // Save the email locally so you don't need to ask the user for it again
     // if they open the link on the same device.
     UserDefaults.standard.set(email, forKey: "Email")
     self.showMessagePrompt("Check your email for link")
     // ...
 }
 */
