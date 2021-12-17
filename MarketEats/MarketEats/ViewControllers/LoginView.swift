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
    
    @IBAction func isPressed(_ sender: UIButton) {
        /*
         validate if password is accurate
         validate if email is accurate
         
         if email does not exist then reroute to register.
         if password is forgotten then forget password
         
         if successful, login into home screen
         */
    }
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        //provide code for forget password
    }
    
}
