//
//  RealmHelper.swift
//  DailyPlannerMVVM
//
//  Created by MacOS on 4.03.2022.
//

import Foundation
import Realm
import RealmSwift

class RealmHelper {
    
    private var   database:Realm
    static let   sharedInstance = RealmHelper()
    
    private init() {
        database = try! Realm()
    }
    
    func addCharacterToFavorites(characterDetails: CharacterDetails) {
        try! database.write {
            //database.add(characterDetails)
            database.create(CharacterDetails.self, value: characterDetails)
            
        }
    }
    
    func fetchFavoriteList() -> Results<CharacterDetails> {
        let object = database.objects(CharacterDetails.self)
        return object;
    }
    
    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
    
    func deleteFromDb(characterDetails: CharacterDetails)   {
        try! database.write {
            database.delete(characterDetails)
        }
    }
}

