//
//  UIBarButtonItem+Empty.swift
//  CodePracticeExample
//
//  Created by Yu Sun on 5/9/18.
//  Copyright © 2018 Yu Sun. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    public static let empty = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    public convenience init(title: String) {
        self.init(title: title, style: .plain, target: nil, action: nil)
    }
}
