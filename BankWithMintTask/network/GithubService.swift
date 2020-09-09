//
//  GithubService.swift
//  BankWithMintTask
//
//  Created by CWG Mobile Dev on 09/09/2020.
//  Copyright © 2020 css. All rights reserved.
//

import Foundation
import Moya

enum GithuService {
    case getCommits
}
extension GithuService:TargetType{
    var baseURL: URL {
        return URL(string: "https://api.github.com/repos/rails/rails/commits?page=0&per_page=2")!
    }
    var path: String {
        return ""
    }
    var method: Moya.Method {
        switch self {
        case .getCommits:
            return .get
        }
    }
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getCommits:
            print("request \(Task.requestPlain)")
            return .requestPlain
           }
    }
    
    var headers: [String : String]? {
        return  ["content-type":"application/json "]
    }
    
    
}

