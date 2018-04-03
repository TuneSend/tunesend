//
//  UIButton+Animate.swift
//  keyboard
//
//  Created by Michael Haviv on 4/3/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import UIKit

extension UIButton {
  
  func pulsate() {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.6
    pulse.fromValue = 0.90
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = 1
    pulse.initialVelocity = 0.5
    pulse.damping = 1.0
    layer.add(pulse, forKey: "pulse")
  }
}
