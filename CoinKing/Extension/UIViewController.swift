//
//  UIViewController.swift
//  CoinKing
//
//  Created by 홍정연 on 12/1/23.
//

import NVActivityIndicatorView

extension UIViewController {
    private var activityIndicatorView: NVActivityIndicatorView? {
        return view.subviews.first { $0 is NVActivityIndicatorView } as? NVActivityIndicatorView
    }

    func showLoadingIndicator() {
        if activityIndicatorView == nil {
            let indicatorView = NVActivityIndicatorView(frame: .zero, type: .ballScale, color: .gray, padding: nil)
            indicatorView.center = view.center
            view.addSubview(indicatorView)
        }

        activityIndicatorView?.startAnimating()
    }

    func hideLoadingIndicator() {
        activityIndicatorView?.stopAnimating()
    }
}
