//
//  Localizable.swift
//  PaymentAuto
//
//  Created by TaiVC on 1/5/24.
//

import Foundation
class Localizable:NSObject {
    
    var bundle: Bundle!
    
    static var myClass:Localizable?
    static var shared: Localizable {
        if(myClass == nil){
            myClass = Localizable()
        }
        return myClass ?? Localizable()
    }
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    func localizedString(key:String, comment:String) -> String {
        return bundle.localizedString(forKey: key, value: comment, table: nil)
    }
    
    func localizedString(key:String) -> String {
        return bundle.localizedString(forKey: key, value: "", table: nil)
    }
    
    //MARK:- setLanguage
    // Sets the desired language of the ones you have.
    // If this function is not called it will use the default OS language.
    // If the language does not exists y returns the default OS language.
    func setLanguage(languageCode:String) {
        var appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        appleLanguages.remove(at: 0)
        appleLanguages.insert(languageCode, at: 0)
        UserDefaults.standard.set(appleLanguages, forKey: "AppleLanguages")
        UserDefaults.standard.synchronize() //needs restarts
        if let languageDirectoryPath = Bundle(for: Localizable.self).path(forResource: languageCode, ofType: "lproj")  {
            bundle = Bundle.init(path: languageDirectoryPath)
        } else {
            resetLocalization()
        }
    }
    
    //MARK:- resetLocalization
    //Resets the localization system, so it uses the OS default language.
    func resetLocalization() {
        bundle = Bundle.main
    }
    
}

