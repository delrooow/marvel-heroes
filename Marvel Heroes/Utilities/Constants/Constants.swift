//
//  Constants.swift
//  Marvel Heroes
//
//  Created by Stephen James Del Rosario on 11/19/20.
//

import Foundation

enum MenuSegue {
    static let heroList = "showHeroList"
    static let about = "showAbout"
}

enum HeroListSegue {
    static let heroDetail = "showHeroDetail"
}

enum MarvelHero {
    static let urlString = "https://simplifiedcoding.net/demos/marvel/"
}

enum TableViewCell {
    static let cellIdentifier = "HeroListTableViewCell"
}

enum GoogleSearch {
    static let baseURL = "https://www.google.co.in/search?q="
}
