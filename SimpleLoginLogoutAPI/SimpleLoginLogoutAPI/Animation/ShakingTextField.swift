//
//  ShakingTextField.swift
//  SimpleLoginLogoutAPI
//
//  Created by Lainel John Dela Cruz on 12/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class ShakingTextField: UITextField {
    func shake(){
        let animation=CABasicAnimation(keyPath: "position");
        animation.duration=0.05;
        animation.repeatCount=5;
        animation.autoreverses=true;
        animation.fromValue=NSValue(cgPoint: CGPoint(x: self.center.x-4, y: self.center.y));
        animation.toValue=NSValue(cgPoint: CGPoint(x: self.center.x+4, y: self.center.y));
//        let animation=CABasicAnimation(keyPath: "opacity");
//        animation.fromValue=1;
//        animation.toValue=0;
        self.layer.add(animation, forKey: "position");
    }

}
