//
//  UserInfoList.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 09/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


class UserInfoList{
    var list=[UserInfo]();
    init(){}
    func GetListByFirstname(name:String){
        list.append(UserInfo(id: "1ee", uname: "ljbdelacruz", pass: "soyamilk"));
        list.append(UserInfo(id: "2ee", uname: "ljbdelacruz01", pass: "soyamilk"));
    }
}

