//
//  StorageManager.swift
//  MatthewPlaces
//
//  Created by Матвей Чернышев on 18.12.2019.
//  Copyright © 2019 Matvey Chernyshov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func  saveObject(_ place: Place) {
        try! realm.write {
          realm.add(place)
        }
    }
    
    static func deleteObject(_ place: Place) {
        
        try! realm.write {
            realm.delete(place)
        }
    }
}
