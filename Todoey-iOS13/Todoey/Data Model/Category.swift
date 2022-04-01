//
//  Category.swift
//  Todoey
//
//  Created by 원성현 on 2022/04/01.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category:Object {
    @objc dynamic var name:String = ""
    let items = List<Item>()

}
