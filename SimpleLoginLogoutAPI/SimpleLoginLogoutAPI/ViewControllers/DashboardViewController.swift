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
    var progressPercent:CGFloat=0.1;
    override func viewDidLoad(){
        super.viewDidLoad()
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
        performSegue(withIdentifier: "logoutSegue", sender: sender);
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
