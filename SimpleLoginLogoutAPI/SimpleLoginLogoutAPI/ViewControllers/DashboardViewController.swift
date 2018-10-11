//
//  DashboardViewController.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 09/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import CircleProgressBar

class DashboardViewController: UIViewController {
    var userLoginInfo:UserInfo?;
    
    @IBOutlet weak var introLabel: UILabel!
    
    var progressPercent:CGFloat=0.1;
    override func viewDidLoad(){
        super.viewDidLoad()
        self.introLabel.text="Welcome "+self.userLoginInfo!.Username;
        self.navigationController?.isNavigationBarHidden=true;
        // Do any additional setup after loading the view.
        self.circleProgressBar.setProgress(self.progressPercent, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OnDecreaseClick(_ sender: UIButton) {
        if self.progressPercent>=0{
            self.progressPercent-=0.01;
            self.circleProgressBar.setProgress(self.progressPercent, animated: true)
        }
    }
    @IBAction func OnIncreaseClick(_ sender: UIButton) {
        if self.progressPercent <= 1{
            self.progressPercent+=0.01;
            self.circleProgressBar.setProgress(self.progressPercent, animated: true)
        }
    }
    @IBOutlet weak var circleProgressBar: CircleProgressBar!
    
    @IBAction func onLogoutClick(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
