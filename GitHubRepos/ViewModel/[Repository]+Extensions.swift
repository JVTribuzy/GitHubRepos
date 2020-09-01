//
//  [Repository]+Extensions.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 01/09/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

extension Array where Element == Repository{
    func sortAlphabetically() -> [Repository] {
        return self.sorted(by: { $0.name < $1.name })
    }
}
