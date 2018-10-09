//
//  userInfo.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 08/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


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
    
    func Authenticate()->Bool{
        //invoke authenticate function to api
//        var data=self.PostData(myURL: baseURL+"Login/Authenticate", paramData: "username="+self.Username+"&password="+password);
        return self.Username == "ljbdelacruz" && self.Password=="soyamilk" ? true:false;
    }
    
    
    
    
 
    
}
