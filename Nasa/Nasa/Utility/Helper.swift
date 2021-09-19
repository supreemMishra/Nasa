//
//  Helper.swift
//  Nasa
//
//  Created by Supreem Mishra on 19/09/21.
//

import Foundation
import UIKit

@objc final class Helper: NSObject {
    // MARK:- Properties
    @objc static var singleton = Helper()
    @objc var imageArray = [ImageModel]()
    
    // MARK: - check duplicate data in favorite list
    class func checkDuplicate(dataImage: ImageModel) -> Bool {
        var present = false
        let _ = Helper.singleton.imageArray.filter({ (data) -> Bool in
            if data.title == String(dataImage.title) {
                present = true
                return true
            } else {
                present = false
                return false
            }
        })
        return present
    }
    
    // MARK: - save data
    class func saveData(dataToBeSaved: ImageModel) {
        let userDefaults = UserDefaults.standard
        guard let encodedData: Data = try? NSKeyedArchiver.archivedData(withRootObject: dataToBeSaved, requiringSecureCoding: false) else {
            return
        }
        userDefaults.set(encodedData, forKey: AppConstants.dataKey)
        userDefaults.synchronize()
    }
    
    // MARK: - retrieve data
    class func retrieveData() -> ImageModel {
        guard let data = UserDefaults.standard.data(forKey: AppConstants.dataKey) else { return ImageModel() }
            guard let imageData = (try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)) as? ImageModel else { return ImageModel() }
            return imageData
    }
}
