//
//  ViewController.swift
//  Nasa
//
//  Created by Supreem Mishra on 18/09/21.
//

import UIKit
import Foundation
import AVKit
import AVFoundation
import WebKit

class ViewController: UIViewController {
    // MARK: -IBOutlets
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var dayImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var explanation: UILabel!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: -Properties
    let imageCache = NSCache<NSString, UIImage>()
    var datePicker = UIDatePicker()
    var toolBar = UIToolbar()
    var imageData = ImageModel()
    var viewModel = ImageViewModel()
    var selectedDate = ""
    var player: AVPlayer!
    var playerViewController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.imageController = self
        viewModel.getData()
    }
    
    //MARK: - initialise image data
    func initializeData() {
        DispatchQueue.main.async {
            self.imageTitle.text = self.imageData.title
            self.date.text = AppConstants.imageText + self.imageData.date
            self.dayImage.image = self.imageData.image
            self.explanation.text = self.imageData.explanation
        }
    }
    
    //MARK: - play video from url
    func playVideoOfTheDay(videoUrl: String) {
        let videoURL = URL(string: videoUrl)
        if let url = videoURL {
        webView.load(URLRequest(url: url))
        }
    }
    
    //MARK: - search button pressed
    @IBAction func searchPressed(_ sender: Any) {
        setUpDatePicker()
    }
    
    //MARK: - add to favorite list
    @IBAction func addToFavoritePressed(_ sender: Any) {
        if !Helper.checkDuplicate(dataImage: imageData) {
        presentAlert(withTitle: AppConstants.selectedDataAlert, message: "")
        if let image = dayImage.image {
            imageData.image = image
        }
        viewModel.addToFavorite(imageData: imageData)
        }
        else {
            presentAlert(withTitle: AppConstants.dataPresent, message: "")
        }
    }
    
    //MARK: - add to favorite list
    @IBAction func presentFavoriteList(_ sender: Any) {
        let favoriteListViewConntroller = self.storyboard?.instantiateViewController(withIdentifier: AppConstants.favoritelistIdentifier) as! FavoriteListViewController
        self.navigationController?.pushViewController(favoriteListViewConntroller, animated: true)
    }
}

