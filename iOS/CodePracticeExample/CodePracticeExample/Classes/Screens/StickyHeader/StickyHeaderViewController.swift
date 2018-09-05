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
    private static let stickyHeaderHeight: CGFloat = 100
    
    private let disposeBag: DisposeBag = DisposeBag()
    private let viewModel: StickyHeaderViewModel = StickyHeaderViewModel()

    // MARK: - UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Theme.Color.stickyHeaderHeaderLabel
        label.font = Theme.Font.stickyHeaderHeaderLabel
        label.numberOfLines = 2
        label.textAlignment = .left
        
        viewModel.header
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        return label 
    }()
    
    private lazy var stickyHeaderView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowColor = #colorLiteral(red: 0.2588235294, green: 0.2588235294, blue: 0.2588235294, alpha: 1).cgColor
        
        scrollView.rx.contentOffset
            .map { [weak self] in
                guard let height = self?.headerLabel.bounds.height else { return 0 }
                return ($0.y > height ? 0.2 : 0)
            }
            .bind(to: view.layer.rx.shadowOpacity)
            .disposed(by: disposeBag)
        
        return view
    }()
    
    private lazy var memberImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "headImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var headerCopyTextView: UITextView = {
        let textView: UITextView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.backgroundColor = UIColor.clear
        textView.textColor = Theme.Color.headerCopy
        textView.font = Theme.Font.headerCopy
        textView.textAlignment = .justified
        
        viewModel.headerCopy
            .bind(to: textView.rx.text)
            .disposed(by: disposeBag)
        
        return textView
    }()
    
    private lazy var seperatorLineView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.Color.seperatorLine
        
        return view
    }()
    
    private lazy var memberSectionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false 
        label.textColor = Theme.Color.memberSectionTitle
        label.font = Theme.Font.memberSectionTitle
        
        label.text = "Members"
        
        return label
    }()
    
    private lazy var memberStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var johnStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var johnImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "john"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
        
        return imageView
    }()
    
    private lazy var johnCopyLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = Theme.Color.memberCopy
        label.font = Theme.Font.memberCopy
        
        viewModel.johnCopy
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        return label
    }()
    
    private lazy var paulStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var paulImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "paul"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
        
        return imageView
    }()
    
    private lazy var paulCopyLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = Theme.Color.memberCopy
        label.font = Theme.Font.memberCopy
        
        viewModel.paulCopy
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        return label
    }()
    
    private lazy var georgeStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var georgeImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "george"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
        
        return imageView
    }()
    
    private lazy var georgeCopyLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = Theme.Color.memberCopy
        label.font = Theme.Font.memberCopy
        
        viewModel.georgeCopy
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        return label
    }()
    
    private lazy var ringoStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var ringoImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "george"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
        
        return imageView
    }()
    
    private lazy var ringoCopyLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = Theme.Color.memberCopy
        label.font = Theme.Font.memberCopy
        
        viewModel.ringoCopy
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(scrollView)
        
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(headerCopyTextView)
        scrollView.addSubview(seperatorLineView)
        scrollView.addSubview(memberSectionLabel)
        scrollView.addSubview(memberStackView)
        scrollView.addSubview(stickyHeaderView)
        
        stickyHeaderView.addSubview(memberImageView)
        
        memberStackView.addArrangedSubview(johnStackView)
        memberStackView.addArrangedSubview(paulStackView)
        memberStackView.addArrangedSubview(georgeStackView)
        memberStackView.addArrangedSubview(ringoStackView)
        
        johnStackView.addArrangedSubview(johnImageView)
        johnStackView.addArrangedSubview(johnCopyLabel)
        
        paulStackView.addArrangedSubview(paulCopyLabel)
        paulStackView.addArrangedSubview(paulImageView)
        
        georgeStackView.addArrangedSubview(georgeImageView)
        georgeStackView.addArrangedSubview(georgeCopyLabel)
        
        ringoStackView.addArrangedSubview(ringoCopyLabel)
        ringoStackView.addArrangedSubview(ringoImageView)
        
        layoutScreen()
    }
    
    // MARK: - Layout
    
    private func layoutScreen() {
        layoutScrollView()
        layoutStickyHeader()
        layoutMembersStackView()
    }
    
    private func layoutScrollView() {
        
        NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
                scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                headerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
                headerLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                headerLabel.widthAnchor.constraint(equalToConstant: 100),
                stickyHeaderView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor),
                stickyHeaderView.topAnchor.constraint(greaterThanOrEqualTo: headerLabel.bottomAnchor),
                stickyHeaderView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
                stickyHeaderView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
                stickyHeaderView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
                stickyHeaderView.heightAnchor.constraint(equalToConstant: StickyHeaderViewController.stickyHeaderHeight),
                headerCopyTextView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20),
                headerCopyTextView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20),
                headerCopyTextView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: StickyHeaderViewController.stickyHeaderHeight + 10),
                seperatorLineView.topAnchor.constraint(equalTo: headerCopyTextView.bottomAnchor, constant: 10),
                seperatorLineView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20),
                seperatorLineView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20),
                seperatorLineView.heightAnchor.constraint(equalToConstant: 1.0 / UIScreen.main.scale),
                memberSectionLabel.topAnchor.constraint(equalTo: seperatorLineView.bottomAnchor, constant: 10),
                memberSectionLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20),
                memberStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20),
                memberStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20),
                memberStackView.topAnchor.constraint(equalTo: memberSectionLabel.bottomAnchor, constant: 10),
                memberStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])
        
    }
    
    private func layoutStickyHeader() {
        NSLayoutConstraint.activate([
                memberImageView.topAnchor.constraint(equalTo: stickyHeaderView.topAnchor),
                memberImageView.leftAnchor.constraint(equalTo: stickyHeaderView.leftAnchor),
                memberImageView.rightAnchor.constraint(equalTo: stickyHeaderView.rightAnchor),
                memberImageView.bottomAnchor.constraint(equalTo: stickyHeaderView.bottomAnchor)
            ])
    }
    
    private func layoutMembersStackView() {
        NSLayoutConstraint.activate([
                johnStackView.heightAnchor.constraint(equalToConstant: 200),
                paulStackView.heightAnchor.constraint(equalToConstant: 200),
                georgeStackView.heightAnchor.constraint(equalToConstant: 250),
                ringoStackView.heightAnchor.constraint(equalToConstant: 250)
            ])
    }

}
