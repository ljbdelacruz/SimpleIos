//
//  QueryData.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 09/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class QueryData{
    private var devMessage:String="";
    private var uMessage:String="";
    
    init(){
    }
    func PostAlamo(url:String, param:[String:String], completionHandler: @escaping (Any?, Bool?, Error?) -> ()){
        Alamofire.request(baseURL+url, method:.post, parameters:param).responseJSON{response in
            if response.result.isSuccess{
                let data:JSON=JSON(response.result.value!);
                completionHandler(data as? JSON, true, nil)
            }else{
                self.devMessage="Error \(response.result.error!)";
                completionHandler("Not Connected to internet" as? String, false, nil)
            }
        };
    }
//    func GetAlamo(url:String, param:[String:String]){
//        Alamofire.request(baseURL+url, method:.get, parameters:param).responseJSON(completionHandler: { response in
//            if response.result.isSuccess{
//                let data:JSON=JSON(response.result.value!);
//            }else{
//                self.devMessage="Error \(response.result.error)";
//                self.uMessage="Please make sure you have internet connection!";
//            }
//        });
//    }
    
    func FormatJSON(json:JSON, isSuccess:Bool)->Any{
        return isSuccess==true ? json["data"] : json["message"].stringValue;
    }
    func CheckJSONSuccess(json:JSON)->Bool{
        return json["success"].boolValue == true ? true :false;
    }
    
    func PostData(myURL:String, paramData:String)->Any{
        let url=URL(string: myURL);
        let session=URLSession.shared;
        let request=NSMutableURLRequest(url:url!);
        request.httpMethod="POST";
        let param=paramData;
        request.httpBody=param.data(using: String.Encoding.utf8);
        let task=session.dataTask(with: request as URLRequest, completionHandler:{
            (data, response, error) in
            guard let _:Data = data else{
                return
            }
            do{
                let json=try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch{
                return
            }
        })
        return request;
    }
    func GetData(myURL:String, paramData:String)->Any{
        return "";
    }
}
