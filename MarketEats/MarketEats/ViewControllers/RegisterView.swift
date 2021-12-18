//
//  RegisterView.swift
//  MarketEats
//
//  Created by Alexis Powell on 12/17/21.
//

import UIKit

import Firebase
import FirebaseAuth


class RegisterView: UIViewController {

    @IBOutlet weak var emailString: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordTextConfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    

    //submit button - Validations work
    //create user
    @IBAction func isPressed(_ sender: Any) {
        
        //validate if email already exists
        //validate if fields are completed
        if (((emailString.text?.isEmpty)! || (passwordText.text?.isEmpty)! || (passwordTextConfirm.text?.isEmpty)!)) {
            
            let alert = UIAlertController.init(title: "Registration Error" , message: "Please fill the entire form", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style:.default))
            present(alert ,animated: true, completion: nil)
          
        }
        
        //validate if both passwords are equal
        else if( ((passwordText.text?.elementsEqual(passwordTextConfirm.text!))!) != true){
            let alert = UIAlertController.init(title: "Password Confirmation Error" , message: "Passwords must match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style:.default))
            present(alert ,animated: true, completion: nil)

        }
        
        //if successful, reroute to login
        //add user information in db
        
        Auth.auth().createUser(withEmail: emailString.text!, password: passwordText.text!){ authResult,error in
            
        }
        
        
        //success message
        self.dismiss(animated: true, completion: nil) //dismiss page after registering
        let alert = UIAlertController.init(title: "Success!" , message: "Registration Completed", preferredStyle: .alert)
   
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginView
        
        self.present(vc, animated: true, completion: nil)
       
    }
    
    
    
}
