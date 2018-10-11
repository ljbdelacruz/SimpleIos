//
//  CodeEnterViewController.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 11/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class CodeEnterViewController: UIViewController {
    var code:String?;
    var AuthDelegate:AuthenticationDelegate?;
    @IBOutlet weak var UICodeTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden=true;
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func SubmitCodeOnClick(_ sender: Any) {
        if(self.code != self.UICodeTF.text!){
            self.AuthDelegate?.errorMessage(message: "please enter code that was sent to you");
            self.dismiss(animated: true, completion: nil);
        }else{
            self.performSegue(withIdentifier: "toDashboard", sender: nil);
//            self.dismiss(animated: true, completion: {
//                if(self.code==self.UICodeTF.text!){
//                }
//            });
        }
    }
}
