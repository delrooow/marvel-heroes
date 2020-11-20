//
//  HeroListTableViewCell.swift
//  Marvel Heroes
//
//  Created by Stephen James Del Rosario on 11/19/20.
//

import UIKit

class HeroListTableViewCell: UITableViewCell {
    static let identifier = TableViewCell.cellIdentifier

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Page Setup
    func setupUI() {
        imageContainerView.layer.cornerRadius = imageContainerView.frame.height/2
    }
}
