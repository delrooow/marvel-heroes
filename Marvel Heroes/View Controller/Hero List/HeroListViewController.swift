//
//  HeroListViewController.swift
//  Marvel Heroes
//
//  Created by Stephen James Del Rosario on 11/19/20.
//

import UIKit

class HeroListViewController: UIViewController {
    
    @IBOutlet weak var heroTableViewContainerView: UIView!
    @IBOutlet weak var heroTableView: UITableView!
    
    var heroData = [HeroData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHeroData {
            self.heroTableView.reloadData()
        }
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? HeroDetailViewController {
            destinationVC.heroDetails = heroData[(heroTableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    // MARK: - Fetch Data from API
    func fetchHeroData(completed: @escaping () -> ()) {
        let url = URL(string: MarvelHero.urlString)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.heroData = try JSONDecoder().decode([HeroData].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    // MARK: - Page Setup
    func setupUI() {
        heroTableViewContainerView.layer.cornerRadius = 20
        heroTableViewContainerView.alpha = 1
        heroTableViewContainerView.layer.backgroundColor = UIColor(red: 0.35, green: 0.36, blue: 0.34, alpha: 0.4).cgColor
    }
}

extension HeroListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier, for: indexPath) as! HeroListTableViewCell
        let data = heroData[indexPath.item]
        
        cell.heroImageView.downloaded(from: data.imageurl)
        cell.heroImageView.contentMode = .scaleAspectFill
        cell.heroImageView.layer.cornerRadius = cell.heroImageView.frame.height/2
        cell.heroNameLabel.text = data.name.uppercased()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: HeroListSegue.heroDetail, sender: self)
    }
}
