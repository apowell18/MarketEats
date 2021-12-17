//
//  RegisterView.swift
//  MarketEats
//
//  Created by Alexis Powell on 12/17/21.
//

import UIKit

class RegisterView: UIViewController {

    @IBOutlet weak var emailString: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordTextConfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func isPressed(_ sender: UIButton) {
        //validate if email already exists
        //forget password
        //validate if both passwords are equal
        //re-enter
        
        //if successful, reroute to login
        //add user information in db
        
    }
}
