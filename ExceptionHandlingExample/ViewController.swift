//
//  ViewController.swift
//  ExceptionHandlingExample
//
//  Created by Bob Pascazio on 11/5/15.
//  Copyright © 2015 PACE. All rights reserved.
//

import UIKit

enum EncryptionError: ErrorType {
    case Empty
    case Short
    case Long
    case Invalid
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            let encrypted = try encryptString("secret information!", withPassword: "password")
            print(encrypted)
        } catch EncryptionError.Empty {
            print("You must provide a password.")
        } catch EncryptionError.Short {
            print("Passwords must be at least five characters, preferably eight or more.")
        }  catch EncryptionError.Long {
            print("Passwords must be less than ten characters.")
        } catch {
            print("Something went wrong!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func encryptString(str: String, withPassword password: String) throws -> String {
        
        // Guard is for convenience you can do things this way.
        guard password.characters.count > 0 else { throw EncryptionError.Empty }
        guard password.characters.count >= 5 else { throw EncryptionError.Short }
        guard password.characters.count < 10 else { throw EncryptionError.Long }
        
        // Or with the usual if statement
        if password=="password" {
            throw EncryptionError.Invalid
        }
        
        // complicated encryp6tion goes here
        let encrypted = password + str + password
        return String(encrypted.characters.reverse())
    }
}

