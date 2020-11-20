//
//  Post.swift
//  Marvel Heroes
//
//  Created by Stephen James Del Rosario on 11/19/20.
//

import Foundation

struct HeroData: Decodable {
    let name: String
    let firstappearance: String
    let bio: String
    let realname: String
    let publisher: String
    let imageurl: String
    let team: String
    let createdby: String
}
