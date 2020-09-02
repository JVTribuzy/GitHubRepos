//
//  PullAPI.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 30/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class PullAPI {
    /// Used to fetch all objects like 'Pull' model from the API
    /// - Parameters:
    ///     - owner: The owner of the repository from which we are obtaining the pull requestes list.
    ///     - repositoryName: The name of repository which we are obtaining the pull requestes list.
    ///     - completion: Used to catch teh result of th request.
    func fetch(owner: String, repositoryName: String, then completion: @escaping ([Pull]?) -> Void) {
        guard let url = URLManager().makePullURL(with: owner, from: repositoryName) else {
            completion(nil)
            return
        }
        
        GithubService().fetch(model: [Pull].self, from: url){ pulls in
            DispatchQueue.main.async {
                completion(pulls)
            }
        }
    }
}
