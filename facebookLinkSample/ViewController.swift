//
//  ViewController.swift
//  facebookLinkSample
//
//  Created by snowman on 2017/02/02.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit


class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let  loginButton : FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        
        self.view.addSubview(loginButton)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
        super.viewDidAppear(animated)
        
        //get access token
        let token: FBSDKAccessToken? = FBSDKAccessToken.current()
        if  token != nil {
            let authdata = ["id":token!.userID,
                             "access_token":token!.tokenString,
                              "expiration_date":token!.expirationDate] as [String : Any]
            print("facebook authdata:")
            print(authdata)
        } else {
            print("currentAccessToken is nil-> logout")
            self.customFbLogin.titleLabel?.text = "logout"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var customFbLogin: UIButton!

    @IBAction func fbLoginAction(_ sender: Any) {
        
        let login : FBSDKLoginManager = FBSDKLoginManager()
        login.logIn(withReadPermissions: ["email"], from: self) { ( result:FBSDKLoginManagerLoginResult?, error:Error?) in
            if error != nil {
                print("error")
            } else if (result?.isCancelled)! {
                //canceled
            } else  if (result?.grantedPermissions.contains("email"))! {
                print("login with read email permission succeeded.")
                self.customFbLogin.titleLabel?.text = "logout"
            }
        }
        
    }
}



