//
//  CoinViewController.swift
//  CoinKing
//
//  Created by 홍정연 on 12/1/23.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Kingfisher

class CoinViewController: UIViewController {
    
    let marketItem: Market
    var coinViewModel: CoinViewModel!
    private let disposeBag = DisposeBag()
    
    // 스크롤뷰
    let scrollView: UIScrollView = {
        let view  = UIScrollView()
        return view
    }()
    
    // 스택뷰
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    
    // MARK: priceView(스택뷰 하위뷰)
    let priceView = PriceView()
    
    // MARK: descriptionView(스택뷰 하위뷰)
    let descriptionView = DescriptionView()
    
    // MARK: 주문버튼
    let btnOrder: UIButton = {
        let button = UIButton()
        button.setTitle("주문하기", for: .normal)
        button.setTitleColor(ThemeColor.tint1, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = ThemeColor.primary2
        button.layer.cornerRadius = 24
        return button
    }()
    
    
    
    init(item: Market) {
        self.marketItem = item
        super.init(nibName: nil, bundle: nil)
        self.coinViewModel = CoinViewModel(coinID: item.id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showLoadingIndicator()
        layout()
        
        coinViewModel.fetchCoinDetails()
        
        
        coinViewModel.coinDetails
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { coin in
                // 성공 시 처리
                debugPrint(coin)
                self.hideLoadingIndicator()
                self.bind(coin: coin)
            })
            .disposed(by: disposeBag)
        
        // ViewModel에서 에러 처리를 RxSwift로 처리
        coinViewModel.error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { error in
                // 실패 시 처리
                print(error)
                self.hideLoadingIndicator()
            })
            .disposed(by: disposeBag)
    }
    
    private func layout() {
        self.title = self.marketItem.name
        self.view.backgroundColor = ThemeColor.background
        
        let orderView = UIView()
        orderView.backgroundColor = ThemeColor.primary1
        
        self.view.addSubview(orderView)
        
        orderView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        orderView.addSubview(btnOrder)
        
        btnOrder.snp.makeConstraints { make in
            make.top.equalTo(orderView.snp.top).offset(12)
            make.leading.equalTo(orderView.snp.leading).offset(12)
            make.trailing.equalTo(orderView.snp.trailing).offset(-12)
            make.bottom.equalTo(orderView.safeAreaLayoutGuide.snp.bottom).offset(-12)
            make.height.equalTo(48)
        }
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(orderView.snp.top)
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
        }
        
//        stackView.addArrangedSubview(priceView)
//        stackView.addArrangedSubview(descriptionView)
    }
    
    private func bind(coin: Coin) {
        
        stackView.addArrangedSubview(priceView)
        stackView.addArrangedSubview(descriptionView)
        
        
        priceView.configure(with: coin)
        descriptionView.configure(with: coin)
        
    }
}
