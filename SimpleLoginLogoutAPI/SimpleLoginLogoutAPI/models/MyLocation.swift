//
//  MyLocation.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 10/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import CoreLocation

class MyLocation:QueryData{
    public var ID:String;
    public var longitude:Double;
    public var latitude:Double;
    public let locationManager=CLLocationManager();
    
    
    override init(){
        self.ID="";
        self.longitude=0;
        self.latitude=0;
        super.init();
    }
    convenience init(id:String, long:Double, lat:Double){
        self.init();
        self.ID=id;
        self.longitude=long;
        self.latitude=lat;
    }
    convenience init(coordinate:CLLocationCoordinate2D){
        self.init();
        self.MLinit(coordinate: coordinate)
    }
    func LMInit(delegate:CLLocationManagerDelegate, accuracy:CLLocationAccuracy){
        self.locationManager.delegate=delegate;
        self.locationManager.desiredAccuracy=accuracy;
    }
    func MLinit(coordinate:CLLocationCoordinate2D){
        self.longitude=coordinate.longitude;
        self.latitude=coordinate.latitude;
        print("Coordinates");
        print(self.latitude," ",self.longitude);
    }
    
    
}
