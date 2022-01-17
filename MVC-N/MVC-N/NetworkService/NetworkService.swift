//
//  NetworkService.swift
//  MVC-N
//
//  Created by Александр Касьянов on 17.01.2022.
//

import Foundation

let sampleUrl = "https://jsonplaceholder.typicode.com/posts/1/comments"

//создаём общий менеджер для работы с сетью
//поскольку происходит работа с сетью, создаём синглтон
class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    //метод для получения данных
    public func getData(url: URL, completion: @escaping (Any) -> ()) {
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            //проверяем, получены ли данные
            //если данные не получены, то выходим из метода
            guard let data = data else {return}
            do {
                //извлекаем JSON
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
