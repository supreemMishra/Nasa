//
//  ImageViewModel.swift
//  Nasa
//
//  Created by Supreem Mishra on 18/09/21.
//

import Foundation
import UIKit

enum mediaType: String {
    case video, image
}

class ImageViewModel: NSObject {
    //MARK: -Properties
    var imageController: ViewController?
    var imageData = ImageModel()
    
    //MARK: - get and initialise data
    func getData() {
        if Reachability.isConnectedToNetwork() {
            LoadingOverlay.shared.showOverlay(view: imageController!.view)
            ImageManager.getImageData { (isSuccess, data) in
                if isSuccess {
                    DispatchQueue.main.async { [self] in
                       self.refreshData(data: data)
                    }
                }
            }
        } else {
            let imageData = Helper.retrieveData()
            self.refreshData(data: imageData)
            imageController!.presentAlert(withTitle: AppConstants.internetTitle, message: AppConstants.internetMessage)
        }
    }
    
    //MARK: - get particular date data and initialise data
    func getSelectedData(date: String) {
        if Reachability.isConnectedToNetwork() {
            LoadingOverlay.shared.showOverlay(view: imageController!.view)
            ImageManager.getImageDataOfParticularDateFromServer(date: date) { (isSuccess, data) in
                if isSuccess {
                    DispatchQueue.main.async {
                        Helper.saveData(dataToBeSaved: data)
                        self.refreshData(data: data)
                    }
                }}}
        else {
            imageController!.presentAlert(withTitle: AppConstants.internetTitle, message: AppConstants.internetMessage)
        }
    }
    
    //MARK: - refresh viewController data
    func refreshData(data: ImageModel) {
        self.imageData = data
        self.imageController?.imageData = data
        if self.imageData.media_type == mediaType.image.rawValue {
            self.imageController?.webView.isHidden = true
            self.initializeImageData(imagePath: self.imageData.url)
        } else {
            self.imageController?.dayImage.image = nil
            self.imageController?.webView.isHidden = false
            self.imageController?.playVideoOfTheDay(videoUrl: self.imageData.url)
            self.imageController?.initializeData()
            LoadingOverlay.shared.hideOverlayView()
        }
    }
    
    //MARK: - initialise image
    func initializeImageData(imagePath: String) {
        let url = URL(string: imagePath)
        DispatchQueue.global().async {
            if Reachability.isConnectedToNetwork() {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async { [self] in
                    self.imageController?.imageCache.setObject(UIImage(data: data!) ?? UIImage(), forKey: NSString(string: imagePath))
                    imageData.image = UIImage(data: data!) ?? UIImage()
                    Helper.saveData(dataToBeSaved: imageData)
                    self.imageController?.initializeData()
                    LoadingOverlay.shared.hideOverlayView()
                }
            } else {
                self.imageController?.initializeData()
            }
        }
    }
    
    //MARK: - add favorite data to array
    func addToFavorite(imageData: ImageModel) {
        Helper.singleton.imageArray.append(imageData)
    }
    
}
