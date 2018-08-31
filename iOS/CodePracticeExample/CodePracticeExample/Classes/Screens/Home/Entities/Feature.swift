//
//  Feature.swift
//  CodePracticeExample
//
//  Created by Yu Sun on 31/8/18.
//  Copyright © 2018 Yu Sun. All rights reserved.
//

import UIKit

enum Feature {
    case StickyHeaderOnScrollView
}

extension Feature {
    
    static func all() -> [Feature] {
        return [.StickyHeaderOnScrollView]
    }
    
    var title: String {
        switch self {
            case .StickyHeaderOnScrollView: return "Sticky Header On Scroll View"
        }
    }
    
    var viewController: UIViewController {
        switch self {
            case .StickyHeaderOnScrollView: return StickyHeaderViewController()
        }
    }
}
