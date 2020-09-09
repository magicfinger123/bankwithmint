//
//  ViewController.swift
//  BankWithMintTask
//
//  Created by CWG Mobile Dev on 09/09/2020.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

class ViewController: UIViewController {
    let githubCommits = MoyaProvider<GithuService>()
      var commits:[Parent] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        githubCommits.request(.getCommits) { (result) in
            switch result {
            case .success(let response):
              var parsed:Data?
              let parse :JSON = JSON(response.data as Any)
              do{
              parsed =  try parse.rawData()
              }catch let err{
                 print(err)
              }
              do{
              let rdata = try JSONDecoder().decode(Array<Parent>.self, from: parsed!)
                    self.commits = rdata
                    print("response \(self.commits[0].url)")
                    }catch let err{
                                    print(err)
                                 }
                break
            case .failure(let error):
                print("moya error",error)
                break
            }
        }
        // Do any additional setup after loading the view.
    }


}

