//
//  MarketViewController.swift
//  CoinKing
//
//  Created by 홍정연 on 11/29/23.
//

import UIKit
import Alamofire
import SnapKit
import RxSwift

class MarketViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = MarketViewModel()
    
    // MARK: 코인리스트
    private var coins = [Coin]()
    
    // MARK: 코인 시세 테이블뷰
    private lazy var tableView: UITableView = {
        let v = UITableView()
        v.backgroundColor = .clear
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        bind()
    }
    
    private func layout() {
        self.title = "거래소"
        self.view.backgroundColor = ThemeColor.background
        
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MarketCell.self, forCellReuseIdentifier: MarketCell.cellId)
        
        // Add constraints for the table view
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func bind() {
        // Bind input
        viewModel.fetchDataTrigger.onNext(())
        
        // Bind output
        viewModel.coinDataSubject
            .take(1) // Take only the first emission
            .subscribe(onNext: { [weak self] coins in
                self?.coins = coins
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

extension MarketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MarketCell.cellId, for: indexPath) as? MarketCell else {
            fatalError("Failed to dequeue MarketCell")
        }
        
        let coinData = coins[indexPath.row]
        cell.configure(with: coinData)
        
        return cell
    }
}
