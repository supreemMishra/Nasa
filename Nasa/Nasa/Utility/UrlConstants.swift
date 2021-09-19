//
//  Constant.swift
//  Nasa
//
//  Created by Supreem Mishra on 18/09/21.
//

import Foundation
import UIKit

class UrlConstants: NSObject {
    static let apiPath = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"
    static let dateImage = "\(UrlConstants.apiPath)&date="
}
