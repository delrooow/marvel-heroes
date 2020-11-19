//
//  APIServices.swift
//  Marvel Heroes
//
//  Created by Stephen James Del Rosario on 11/19/20.
//

import Foundation
import Moya

enum APIServices {
    case heroes
}

// MARK: - Target Type
extension APIServices: TargetType {
    var baseURL: URL {
        return URL(string: "https://simplifiedcoding.net/")!
    }
    
    var path: String {
        switch self {
        case .heroes:
            return "demos/marvel/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .heroes:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .heroes:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        
        var headers = ["Content-type": "application/json"]
        let token = APIUserSession.token()
        
        guard token.isEmpty == false, case .bearer = self.authorizationType else {
            return headers
        }
        
        headers["Authorization"] = "Bearer \(token)"
        
        return headers
    }
}

// MARK: - Access Token Requirements
extension APIServices: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType {
        switch self {
        case .heroes:
            return .bearer
        default:
            return .none
        }
    }

}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
