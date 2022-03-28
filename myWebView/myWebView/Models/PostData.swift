//
//  PostData.swift
//  myWebView
//
//  Created by 원성현 on 2022/03/28.
//

import Foundation


struct Results: Decodable {
    let hits: [Post]
}

struct Post:Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
