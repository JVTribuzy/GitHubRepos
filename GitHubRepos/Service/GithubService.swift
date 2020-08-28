//
//  GithubService.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class GithubService {
    private var task: URLSessionDataTask?
    private let session: URLSession = {
        return URLSession(configuration: URLSessionConfiguration.default)
    }()
    
    func fetch<W: Decodable>(model: W.Type, from url: URL?, completion:@escaping (W?) -> Void) {
        guard let fetchURL = url else { return }
        let request = URLRequest(url: fetchURL)
        
        task = session.dataTask(with: request) { (rawData, _, error) in
            guard let data = rawData, error == nil else {
                print("request/data error: ", error ?? "<empty error log>", separator: "\n")
                completion(nil)
                return
            }
            
            do {
                let response: W? = try JSONDecoder.standart.decode(model, from: data)
                completion(response)
            } catch let jsonError {
                print("decoding error: ", jsonError)
                completion(nil)
            }
        }
        
        task?.resume()
    }
}
