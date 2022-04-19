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
        
        // registerNewUser()
        
        //success message
        self.dismiss(animated: true, completion: nil) //dismiss page after registering
        let alert = UIAlertController.init(title: "Success!" , message: "Registration Completed", preferredStyle: .alert)
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginView
        self.present(vc, animated: true, completion: nil)
       
    }
    
}
/*
func registerNewUser(){
    let email = emailString.text!
    let password = passwordText.text!
    
    DatabaseHelper.shared.ifEmailExists(with: email, completion:{[weak self] exists in
      
        guard let strongSelf = self else{
            return
        }
        guard !exists else{
            strongSelf.errorMessage(message: "This email already exists")
            return
        }
        
        /*
        if (!exists){
            let alert = UIAlertController.init(title: "Email Error" , message: "Email already exists", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style:.default))
            self.present(alert ,animated: true, completion: nil)
        }
        */
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {authResults, error in
            guard authResults != nil, error == nil
            else{
                return
            }
            DatabaseHelper.shared.postNewUser(with: User(email: email), completion: {success in
                let user = User(email: email)
            })
        })
    })
}

func errorMessage(message:String){
    let alert = UIAlertController.init(title: "Error" , message:message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title:"OK", style:.default))
    present(alert ,animated: true, completion: nil)
}
*/
