//
//  FBvm.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 11/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import SwiftyJSON;
import FBSDKLoginKit;

class FBvm{
    public var Email:String?;
    public var Name:String?;
    let fbLoginManager=FBSDKLoginManager();
    init(){
        self.Email="";
        self.Name="";
    }
    func RequestPermission(vc:ViewController, completionHandler: @escaping (Any?, Bool?) -> ()){
        self.fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: vc, handler: {(result, error) in
            if error == nil{
                self.GetUserInfo(completionHandler: {
                    (result, success) in
                    if success==true{
                        completionHandler(nil, true);
                    }else{
                        completionHandler(result, false);
                    }
                })
            }else{
                completionHandler(error, false);
            }
        })
    }
    func GetUserInfo(completionHandler: @escaping (Any?, Bool?) -> ()){
        let req=FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"name,email"], httpMethod: "GET");
        req?.start(completionHandler: {
            (connection, result, error) in
            if error == nil{
                let dict=result as! Dictionary<String, String>;
                self.Email=dict["email"]!;
                self.Name=dict["name"]!;
                //dict["name"], dict["email"]
                completionHandler(nil,true)
            }else{
                completionHandler(error,false)
            }
        })
    }
    
}
