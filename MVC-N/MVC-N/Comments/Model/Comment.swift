//
//  Comment.swift
//  MVC-N
//
//  Created by Александр Касьянов on 17.01.2022.
//

import Foundation

struct Comment {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
    //поскольку JSON не всегда приходит в одном формате, создаём проваливающийся инициализатор
    init?(dict: [String: AnyObject]) {
        //извлекаем значения из JSON
        guard let postId = dict["postId"] as? Int,
              let id = dict["id"] as? Int,
              let name = dict["name"] as? String,
              let email = dict["email"] as? String,
              let body = dict["body"] as? String else { return nil }
        
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}

