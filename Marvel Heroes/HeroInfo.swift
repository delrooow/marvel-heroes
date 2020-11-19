//
//  HeroInfo.swift
//  Marvel Heroes
//
//  Created by Stephen James Del Rosario on 11/19/20.
//

import Foundation

// MARK: - HeroInfo
struct HeroInfo: Codable {
    let name, realname, team, firstappearance: String
    let createdby, publisher: String
    let imageurl: String
    let bio: String
}

typealias Hero = [HeroInfo]
