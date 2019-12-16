//
//  ViewController.swift
//  MatthewPlaces
//
//  Created by Матвей Чернышев on 14.12.2019.
//  Copyright © 2019 Matvey Chernyshov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var places = Place.getPlaces()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
         cell.typeLabel.text = places[indexPath.row].type
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].image)
        
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
    }
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {
        
    }
}

