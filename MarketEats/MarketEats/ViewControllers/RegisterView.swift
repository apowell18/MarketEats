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
            return
        }
        
        //Firebase passwords needs to be atleast 6 char. min.
        if((passwordText.text!.count < 6)){
            let alert = UIAlertController.init(title: "Registration Error" , message: "Password needs atleast 6 characters.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style:.default))
            present(alert ,animated: true, completion: nil)
            return
        }
        
        //validate if both passwords are equal
        if( ((passwordText.text?.elementsEqual(passwordTextConfirm.text!))!) != true){
            let alert = UIAlertController.init(title: "Password Confirmation Error" , message: "Passwords must match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style:.default))
            present(alert ,animated: true, completion: nil)
            return
        }
        
        //if successful, reroute to login
        //add user information in db
        
        // registerNewUser()
        signUp()
       
        //NOTE: use
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: emailString.text!, password: passwordText.text!) {(authResult, error) in
            guard let user = authResult?.user, error == nil else{
                print("Error \(error?.localizedDescription)")
                return
            }
            
            //success message
            self.dismiss(animated: true, completion: nil) //dismiss page after registering
            let alert = UIAlertController.init(title: "Success!" , message: "Registration Completed", preferredStyle: .alert)
           
            let storyboard = UIStoryboard(name:"Main", bundle:nil )
            let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginView
            vc.modalPresentationStyle = .overFullScreen
    
            self.present(vc, animated: true)
        }
        
    }

}
