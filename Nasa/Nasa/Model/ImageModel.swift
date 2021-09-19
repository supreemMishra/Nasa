//
//  ImageModel.swift
//  Nasa
//
//  Created by Supreem Mishra on 18/09/21.
//

import Foundation
import UIKit

class ImageModel: NSObject, NSCoding {
    
    var date = ""
    var explanation = ""
    var media_type = ""
    var title = ""
    var url = ""
    var image = UIImage()
    
    override init() {
    }
    
    init(fromDictionary dictionary: [String: Any]) {
        date = dictionary["date"] as? String ?? ""
        explanation = dictionary["explanation"] as? String ?? ""
        media_type = dictionary["media_type"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder) {
        date = aDecoder.decodeObject(forKey: "date") as? String ?? ""
        explanation = aDecoder.decodeObject(forKey: "explanation") as? String ?? ""
        media_type = aDecoder.decodeObject(forKey: "media_type") as? String ?? ""
        title = aDecoder.decodeObject(forKey: "title") as? String ?? ""
        url = aDecoder.decodeObject(forKey: "url") as? String ?? ""
        image = aDecoder.decodeObject(forKey: "image") as? UIImage ?? UIImage()
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: "date")
        aCoder.encode(explanation, forKey: "explanation")
        aCoder.encode(media_type, forKey: "media_type")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(url, forKey: "url")
        aCoder.encode(image, forKey: "image")
    }
}
