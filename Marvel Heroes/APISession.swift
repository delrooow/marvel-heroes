//
//  APISession.swift
//  Marvel Heroes
//
//  Created by Stephen James Del Rosario on 11/19/20.
//

import Foundation
import SwiftyJSON

class APIUserSession {
    
    static let tokenKey = "token"
    
    class func token() -> String {
        guard let token = UserDefaults.standard.value(forKey: tokenKey) as? String else {
            print("unable to locate user defaults with key: \(tokenKey)")
            return ""
        }
        
        return token
    }
    
    class func setToken(token: String) {
        UserDefaults.standard.setValue(token, forKey: tokenKey)
        UserDefaults.standard.synchronize()
    }
    
    class func processUserSession(json: JSON) {
        let token = json[tokenKey].stringValue
        APIUserSession.setToken(token: token)
    }
}
