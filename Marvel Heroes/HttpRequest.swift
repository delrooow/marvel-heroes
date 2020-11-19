//
//  HttpRequest.swift
//  Marvel Heroes
//
//  Created by Stephen James Del Rosario on 11/19/20.
//

import Foundation
import AFNetworking

enum HttpRequestType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Requestable {
    var baseUrl: String { get }
    
    func request(type: HttpRequestType, url: String, parameters: [String: Any],
                 token: String?, completionHandler: @escaping ((URLResponse, Any?, Error?) -> Void)) -> URLSessionTask
}

extension Requestable {

    var configuration: URLSessionConfiguration {
        return URLSessionConfiguration.default
    }
    
    var manager: AFURLSessionManager {
        return AFURLSessionManager(sessionConfiguration: configuration)
    }
    
    var baseUrl: String {
        let defaults = UserDefaults.standard
        let lastEndpoint = String(format: "%@", "LastEndpoint")
        let releaseEndpoint = "ReleaseApiHost"
        
        var key: String?
        
        if let lastEndpoint = defaults.object(forKey: lastEndpoint) as? String {
            key = lastEndpoint
        }
        
        if let url = Bundle.main.infoDictionary?[key ?? releaseEndpoint] as? String {
            return url
        } else {
            return ""
        }
    }
    
    func request(type: HttpRequestType, url: String, parameters: [String: Any],
                 token: String?, completionHandler: @escaping ((URLResponse, Any?, Error?) -> Void)) -> URLSessionTask {
            
        var error: NSError?
        
        let completeUrl = String(format: "%@%@", baseUrl, url)
        
        let request: NSMutableURLRequest = AFHTTPRequestSerializer().request(withMethod: type.rawValue, urlString: completeUrl, parameters: parameters, error: &error)
        
        if let token = token {
            if token.contains("Bearer") {
                request.setValue(token, forHTTPHeaderField: "Authorization")
            } else {
                request.setValue(String(format: "Bearer %@", token), forHTTPHeaderField: "Authorization")
            }
        }
        
        let dataTask = self.manager.dataTask(with: request as URLRequest, completionHandler: completionHandler)
        
        return dataTask
    }
}
