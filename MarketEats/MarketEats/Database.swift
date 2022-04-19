//
//  Database.swift
//  MarketEats
//
//  Created by Alexis Powell on 12/18/21.
//

import Foundation
//import FirebaseDatabase

final class DatabaseHelper{
    static let shared = DatabaseHelper()
    private let database = Database.database(url: "https://marketeats-a6fe5-default-rtdb.firebaseio.com/").reference()
}

struct User{
    let email: String
    
    var checkedEmail: String{
        var checkedEmail = email.replacingOccurrences(of: ".", with: "-")
        checkedEmail = checkedEmail.replacingOccurrences(of: "@", with: "-")
        return checkedEmail
    }
}

extension DatabaseHelper{
    
    //check if email address already exists
    public func ifEmailExists(with email:String, completion: @escaping ((Bool) -> Void)){
        var checkedEmail = email.replacingOccurrences(of: ".", with: "-")
        checkedEmail = checkedEmail.replacingOccurrences(of: "@", with: "-")
        database.child(checkedEmail).observeSingleEvent(of: .value, with: { snapshot in guard snapshot.value as? String != nil else{
            completion(false)
            return
         }
         completion(true)
        })
    }
    public func postNewUser(with user: User, completion: @escaping (Bool)-> Void){
        //check if handler exists
        database.child(user.checkedEmail).setValue(
            ["email": user.checkedEmail], withCompletionBlock: {error, _ in
                guard error == nil else{print("Database write failed")
                    completion(false)
                    return
                }
                
                self.database.child("users").observeSingleEvent(of: .value, with: {snapshot in
                    if var users = snapshot.value as? [[String:String]]{
                        let newElement = ["email": user.checkedEmail]
                        users.append(newElement)
                        self.database.child("users").setValue(newElement, withCompletionBlock: {error, _ in guard error == nil else {
                            completion(false)
                            return
                            }
                                                              
                            completion(true)
                        })
                    }else{
                        let newCollection : [String:String] = [ "email": user.checkedEmail]
                        self.database.child("users").setValue(newCollection, withCompletionBlock: {error, _ in guard error == nil else {
                            completion(false)
                            return
                            }
                            completion(true)
                        })
                    }
                })
                
                
                
                
            })
    }
}
