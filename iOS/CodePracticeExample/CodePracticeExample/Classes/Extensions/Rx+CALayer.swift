//
//  Rx+CALayer.swift
//  CodePracticeExample
//
//  Created by Yu Sun on 5/9/18.
//  Copyright © 2018 Yu Sun. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: CALayer {
    var shadowOpacity: Binder<Float> {
        return Binder(self.base) { layer, shadowOpacity in
            layer.shadowOpacity = shadowOpacity
        }
    }
}
