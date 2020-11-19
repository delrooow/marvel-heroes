//
//  MenuViewController.swift
//  Marvel Heroes
//
//  Created by Stephen James Del Rosario on 11/19/20.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var heroBtnContainer: UIView!
    @IBOutlet weak var aboutBtnContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - Actions
    @IBAction func didPressHeroesBtn(_ sender: Any) {
        performSegue(withIdentifier: MenuSegue.heroList, sender: (Any).self)
    }
    @IBAction func didPressAboutBtn(_ sender: Any) {
        performSegue(withIdentifier: MenuSegue.about, sender: (Any).self)
    }
    
    // MARK: - Page Setup
    func setupUI() {
        heroBtnContainer.layer.cornerRadius = 10
        aboutBtnContainer.layer.cornerRadius = 10
    }
}
