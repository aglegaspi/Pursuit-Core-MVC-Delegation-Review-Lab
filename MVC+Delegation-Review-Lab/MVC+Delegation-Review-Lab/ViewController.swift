//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ChangeFontSize {
    
    let movies = Movie.allMovies
    var currentSize: CGFloat = 17.0

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func getFontSize(value: CGFloat) {
        currentSize = value
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "moviecell") {
            
            cell.textLabel?.text = movies[indexPath.row].name
            cell.detailTextLabel?.text = String(movies[indexPath.row].year)
            
            cell.textLabel?.font = cell.textLabel?.font.withSize(currentSize)
            cell.detailTextLabel?.font = cell.detailTextLabel?.font.withSize(currentSize)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SettingsViewController {
            destination.delegate = self
        }
    }
    
}
