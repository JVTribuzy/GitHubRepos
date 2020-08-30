//
//  PullAPI.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 30/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class PullAPI {
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
