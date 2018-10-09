//
//  ViewController.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 05/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userInfo:UserInfo=UserInfo(id: "", uname: "", pass: "");
    var userList=[UserInfo]();
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBOutlet weak var UIpassword: UITextField!
    @IBOutlet weak var UIusername: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onLoginClick(_ sender: UIButton) {
        self.userInfo.Username=self.UIusername.text!;
        self.userInfo.Password=self.UIpassword.text!;
        
        if(self.userInfo.Authenticate()){
            //allow proceed to dashboard page
            performSegue(withIdentifier: "loginToDashboard", sender: sender);
        }else{
            self.errorMessageLabel.text="Please use valid username and password to login";
            self.errorMessageLabel.alpha=1;
        }
    }
    func ToggleOptions(){
        self.UIpassword.isUserInteractionEnabled = !self.UIpassword.isEnabled;
        self.UIusername.isUserInteractionEnabled = !self.UIusername.isEnabled;
    }
    
    
    
    
}
