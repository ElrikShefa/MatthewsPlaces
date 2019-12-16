//
//  PlaceModel.swift
//  MatthewPlaces
//
//  Created by Матвей Чернышев on 15.12.2019.
//  Copyright © 2019 Matvey Chernyshov. All rights reserved.
//

import Foundation

struct Place {
    
    var name: String
    var location: String
    var type: String
    var restaurantImage: String
    
    
    static let restaurantNames = [
           "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
           "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
           "Speak Easy", "Morris Pub", "Вкусные истории",
           "Классик", "Love&Life", "Шок", "Бочка"
       ]
    
    static func getPlaces() -> [Place] {
        
        var places = [Place]()
        for place in restaurantNames {
            places.append(Place(name: place, location: "Krasnodar", type: "restaurant", restaurantImage: place))
        }
        return places
    }
}
