//
//  LoadingOverlay.swift
//  Nasa
//
//  Created by Supreem Mishra on 19/09/21.
//

import Foundation
import UIKit

public class LoadingOverlay {

    var overlayView : UIView!
    var activityIndicator : UIActivityIndicatorView!

    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }

    init(){
        self.overlayView = UIView()
        self.activityIndicator = UIActivityIndicatorView()

        overlayView.frame =  CGRect(x: 0, y: 0, width: 80, height: 80)
        overlayView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.layer.zPosition = 1

        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        activityIndicator.style = .large
        activityIndicator.color = UIColor.white
        overlayView.addSubview(activityIndicator)
    }

    public func showOverlay(view: UIView) {
        overlayView.center = view.center
        view.addSubview(overlayView)
        activityIndicator.startAnimating()
    }

    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
