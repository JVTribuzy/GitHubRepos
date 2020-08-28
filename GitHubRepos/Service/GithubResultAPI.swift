//
//  GithubResultAPI.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class GithubResultAPI {
    func fetch(then completion: @escaping (GithubResult?) -> Void) {
        guard let url = URLManager.allReposURL else {
            completion(nil)
            return
        }
        
        GithubService().fetch(model: GithubResult.self, from: url){ githubResult in
            DispatchQueue.main.async {
                completion(githubResult)
            }
        }
    }
}
