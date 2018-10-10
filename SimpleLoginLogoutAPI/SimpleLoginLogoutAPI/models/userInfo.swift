//
//  userInfo.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 08/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserInfo:QueryData{
    var ID:String;
    var Username:String;
    var Password:String;
    override init(){
        self.ID="";
        self.Username="";
        self.Password="";
        super.init();
    }
    convenience init(id:String, uname:String, pass:String){
        self.init();
        self.ID=id;
        self.Username=uname;
        self.Password=pass;
    }
    convenience init(json:JSON){
        self.init();
        self.ID=json["ID"].stringValue;
        self.Username=json["EmailAddress"].stringValue;
        self.Password=json["Password"].stringValue;
    }
    
    func Authenticate(completionHandler: @escaping (Any?, Bool?, Error?) -> ()){
//        invoke authenticate function to api
        self.PostAlamo(url: "UserInformation/UTestAuth", param: ["email":self.Username, "pass":self.Password], completionHandler: {
            (response, error)->() in
            var jsonData=response! as! JSON;
            var isSuccess=self.CheckJSONSuccess(json: jsonData);
            var resp=self.FormatJSON(json: jsonData, isSuccess: isSuccess);
            completionHandler(resp as? Any, isSuccess, nil)
        });
    }
    
    
    
    
 
    
}
