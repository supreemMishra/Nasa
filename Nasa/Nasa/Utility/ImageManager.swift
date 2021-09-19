//
//  ImageManager.swift
//  Nasa
//
//  Created by Supreem Mishra on 18/09/21.
//

import Foundation
class ImageManager : NSObject {
    // MARK: - Get image/video of the day from server
    class func getImageData(completionHandler: @escaping (_ isSuccess: Bool,_ data: ImageModel) -> Void) {
        URLSession.shared.dataTask(with: NSURL(string: UrlConstants.apiPath)! as URL) { data, response, error in
            // Handle result
            do {
                let getResponse = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments)
                let imageModel = ImageModel.init(fromDictionary: (getResponse as? [String : Any])!)
                completionHandler(true, imageModel)
            } catch {
                print("error serializing JSON: \(error)")
            }
        }.resume()
    }
    
    // MARK: - Get image/video of particular date from server
    class func getImageDataOfParticularDateFromServer(date: String, completionHandler: @escaping (_ isSuccess: Bool, _ data: ImageModel) -> Void) {
        URLSession.shared.dataTask(with: NSURL(string: UrlConstants.dateImage + date)! as URL) { data, response, error in
            // Handle result
            do {
                let getResponse = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments)
                let imageModel = ImageModel.init(fromDictionary: (getResponse as? [String : Any])!)
                completionHandler(true, imageModel)
            } catch {
                print("error serializing JSON: \(error)")
            }
        }.resume()
    }
}
