//
//  HomeViewController.swift
//  CodePracticeExample
//
//  Created by Yu Sun on 31/8/18.
//  Copyright © 2018 Yu Sun. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    
    private let disposeBag: DisposeBag = DisposeBag()
    private let viewModel: HomeViewModel = HomeViewModel()
    
    // MARK: - UI
    
    lazy var tableView: UITableView = {
        let cellType = UITableViewCell.self
        let identifier = "FeatureCell"
        
        let tableView: UITableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableView.register(cellType, forCellReuseIdentifier: identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        viewModel.features
            .bind(to: tableView.rx.items(cellIdentifier: identifier, cellType: UITableViewCell.self)) { (_, element, cell) in
                cell.textLabel?.text = element.title
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Feature.self)
            .bind(to: viewModel.selectedFeature)
            .disposed(by: disposeBag)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        layout()
        bindViewModel()
    
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    private func bindViewModel() {
        
        viewModel.homeTitle
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] screenTitle in
                self?.title = screenTitle
            })
            .disposed(by: disposeBag)
        
        viewModel.viewFeature
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .map { $0.viewController }
            .subscribe(onNext: { [weak self] viewController in
                self?.navigationController?.pushViewController(viewController, animated: true)
            })
            .disposed(by: disposeBag)
    }

}

