//
//  WeatherViewModel.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 11/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherViewModel:QueryData{
    var cityName:String?;
    var condition:String?;
    var degrees:String?;
    var location:MyLocation?;
    override init(){
        super.init();
    }
    convenience init(cname:String, cond:String, degree:String, location:MyLocation){
        self.init();
        self.cityName=cname;
        self.condition=cond;
        self.degrees=degree;
        self.location=location;
    }
    func RequestWeatherDataByCity(completionHandler: @escaping (Any?, Bool?) -> ()){
        var param:[String:String]=["q":self.cityName!, "appid":weatherDataAPI];
        self.PostAlamo(url: weatherDataURL, param: param, completionHandler: {
            (result, isSuccess, error) in
            if error == nil{
                print("Weather data");
                print(result!);
                completionHandler(result, true);
            }else{
                completionHandler(error, false);
            }
        })
    }
    func RequestWeatherDataByGeolocation(completionHandler: @escaping (Any?, Bool?) -> ()){
        var param:[String:Any]=["lat":self.location?.latitude, "lon": self.location?.longitude, "appid":weatherDataAPI];
        self.GetAlamo(url: weatherDataURL, param: param, completionHandler: {
            (result, isSuccess, error) in
            if error == nil{
                var json=result! as! JSON;
                self.cityName=json["name"].stringValue;
                let calc=Int(json["main"]["temp"].double!-273.15);
                self.degrees=String(calc);
                self.condition=json["weather"][0]["description"].stringValue;
                print(self.condition);
                print(json);
                completionHandler(json, true);
            }else{
                completionHandler(error, false);
            }
        })

    }
    
    
    
    
    
}
