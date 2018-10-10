//
//  ViewController.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 05/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var userInfo:UserInfo=UserInfo(id: "", uname: "", pass: "");
    var locationData:MyLocation=MyLocation();
    var myFriendsLoc=[MyLocation]();
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var UIpassword: UITextField!
    @IBOutlet weak var UIusername: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loadingNotif: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationData.LMInit(delegate: self, accuracy: kCLLocationAccuracyHundredMeters);
        self.locationData.locationManager.requestWhenInUseAuthorization();
        self.locationData.locationManager.startUpdatingLocation();

        //this should work if connected to personal server
        self.UIusername.text="ljbdelacruz123@gmail.com";
        self.UIpassword.text=""
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onLoginClick(_ sender: UIButton) {
        self.ToggleOptions();
        self.loadingNotif.alpha=1;
        self.userInfo.Username=self.UIusername.text!;
        self.userInfo.Password=self.UIpassword.text!;
        self.userInfo.Authenticate(completionHandler: {
            (response, isSuccess,error) in
            if(isSuccess!==false){
                let message=response! as! String
                self.errorMessageLabel.text=message;
                self.errorMessageLabel.alpha=1;
            }else{
                self.performSegue(withIdentifier: "loginToDashboard", sender:sender);
            }
            self.loadingNotif.alpha=0;
            self.ToggleOptions();
        })
    }
    func ToggleOptions(){
        self.UIpassword.isUserInteractionEnabled = !self.UIpassword.isEnabled;
        self.UIusername.isUserInteractionEnabled = !self.UIusername.isEnabled;
    }
    
    //LocationManager methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var location=locations[locations.count-1];
        //as soon as the accuracy is ok stop updating in getting location to avoid battery drainage
        //since this activity is battery intensive
        if(location.horizontalAccuracy>0){
            self.locationData.locationManager.stopUpdatingLocation();
            self.locationData.MLinit(coordinate: location.coordinate);
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Make sure that your location is enabled or not in a airplane mode");
    }
    
    
    
    
}

