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
        
        if (((emailText.text?.isEmpty)! || (passwordText.text?.isEmpty)!)) {
            let alert = UIAlertController.init(title: "Login Error" , message: "Please fill the entire form", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style:.default))
            present(alert ,animated: true, completion: nil)
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
    
    //present registeration page
    
    @IBAction func pressedRegister(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "RegisterViewController") as! RegisterView
        self.present(vc, animated: true, completion: nil)
        
    }
}


