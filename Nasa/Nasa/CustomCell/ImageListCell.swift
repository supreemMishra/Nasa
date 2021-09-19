//
//  ImageListCell.swift
//  Nasa
//
//  Created by Supreem Mishra on 19/09/21.
//

import Foundation
import UIKit
import WebKit

class  ImageListCell: UITableViewCell {
    // MARK: -IBOutlets
    @IBOutlet var dayImage: UIImageView!
    @IBOutlet var imageTitle: UILabel!
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var webView: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - initialise cell data
    func initialiseData(data: ImageModel) {
        if data.media_type == mediaType.image.rawValue {
            dayImage.image = data.image
            webView.isHidden = true
        } else {
            let videoURL = URL(string: data.url)
            webView.load(URLRequest(url: videoURL!))
        }
        imageTitle.text = data.title
        releaseDate.text = data.date
    }
}
