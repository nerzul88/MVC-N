//
//  NetworkError.swift
//  MVC-N
//
//  Created by Александр Касьянов on 17.01.2022.
//

import Foundation

//возможные ошибки с сетью
enum NetworkError: Error {
    case failInternetError
    case noInternetConnection
}
