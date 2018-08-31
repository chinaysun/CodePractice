//
//  StickyHeaderViewController.swift
//  CodePracticeExample
//
//  Created by Yu Sun on 31/8/18.
//  Copyright © 2018 Yu Sun. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class StickyHeaderViewController: UIViewController {
    
    private let disposeBag: DisposeBag = DisposeBag()

    // MARK: - UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
