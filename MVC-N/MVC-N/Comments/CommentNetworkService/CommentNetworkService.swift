//
//  CommentNetworkService.swift
//  MVC-N
//
//  Created by Александр Касьянов on 17.01.2022.
//

import Foundation

//создаём местного менеджера для работы с сетью
class CommentNetworkService {
    
    static func getComments(completion: @escaping(GetCommentResponse) -> ()) {
        guard let url = URL(string: sampleUrl) else {return}
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetCommentResponse(json: json)
                completion(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private init() {}
}
