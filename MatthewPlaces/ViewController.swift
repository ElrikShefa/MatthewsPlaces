//
//  ViewController.swift
//  MatthewPlaces
//
//  Created by Матвей Чернышев on 14.12.2019.
//  Copyright © 2019 Matvey Chernyshov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let restaurantNames = [
           "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
           "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
           "Speak Easy", "Morris Pub", "Вкусные истории",
           "Классик", "Love&Life", "Шок", "Бочка"
       ]


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = restaurantNames[indexPath.row]
        cell?.imageView?.image = UIImage(named: restaurantNames[indexPath.row])
        return cell!
    }

}

