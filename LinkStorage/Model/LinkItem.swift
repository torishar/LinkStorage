//
//  LinksItem.swift
//  LinkStorage
//
//  Created by Viktoriia Sharukhina on 05.03.2023.
//

import Foundation
import RealmSwift

class Link: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String = ""
    @Persisted var url: String = ""
}
