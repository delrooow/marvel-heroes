//
//  HeroDetailViewController.swift
//  Marvel Heroes
//
//  Created by Stephen James Del Rosario on 11/19/20.
//

import UIKit

class HeroDetailViewController: UIViewController {

    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var detailsContainer: UIView!
    @IBOutlet weak var heroRealName: UILabel!
    @IBOutlet weak var heroTeam: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var bioLabel: UILabel!
    
    var heroDetails: HeroData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetails()
        setupUI()
    }
    
    // MARK: - Action
    @IBAction func didPressHeroImageBtn(_ sender: Any) {
        var searchQuery = heroDetails?.name
        searchQuery = searchQuery!.replacingOccurrences(of: " ", with: "+")
        
        let searchURL = GoogleSearch.baseURL + searchQuery!
        UIApplication.shared.open(URL(string: searchURL)!, options: [:], completionHandler: nil)
    }

    // MARK: - Detail Setup
    func setupDetails() {
        heroName.text = heroDetails?.name.uppercased()
        heroTeam.text = heroDetails?.team.uppercased()
        heroRealName.text = heroDetails?.realname.uppercased()
        bioTextView.text = heroDetails?.bio.uppercased()
        heroImage.downloaded(from: (heroDetails?.imageurl)!)
    }
    
    // MARK: - Page Setup
    func setupUI(){
        imageViewContainer.layer.cornerRadius = 10
        detailsContainer.layer.cornerRadius = 10
        heroImage.layer.cornerRadius = 12
        heroImage.contentMode = .scaleAspectFill
        detailsContainer.layer.backgroundColor = UIColor(red: 0.35, green: 0.36, blue: 0.34, alpha: 0.4).cgColor
    }
}
