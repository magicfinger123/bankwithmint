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
    @IBOutlet var tableViewCell: UITableView!
    let githubCommits = MoyaProvider<GithuService>()
    var commits:[RequestByUserElement] = []
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    let appUtil = AppUtil()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCell.delegate = self
        tableViewCell.dataSource = self
        getGitService()
        //showLoading()
    }
    func getGitService(){
        showLoading()
        githubCommits.request(.getCommits) { (result) in
            switch result {
            case .success(let response):
                
                var parsed:Data?
                let parse :JSON = JSON(response.data as Any)
                do{
                    parsed =  try parse.rawData()
                }catch let err{
                    print("response error \(err)")
                }
                do{
                    let rdata = try JSONDecoder().decode(Array<RequestByUserElement>.self, from: parsed!)
                    self.commits = rdata
                    self.tableViewCell.reloadData()
                }catch{
                    do{
                        let rdata = try JSONDecoder().decode(ErrorMessage.self, from: parsed!)
                        self.appUtil.showDismissAlert(title: "Error", message: rdata.message ?? "Could not get commmits", controller: self)
                        print(rdata.documentationUrl!)
                        
                    }
                    catch let err{
                        print("response error \(err)")
                    }
                }
                self.cancelLoading()
                break
            case .failure(let error):
                self.cancelLoading()
                print("moya error",error)
                break
            }
        }
    }
    func showLoading() {
        activityIndicator.startAnimating()
    }
    func cancelLoading() {
        activityIndicator.stopAnimating()
    }
}
extension ViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commit = commits[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
        cell.setCommits(commit: commit)
        return cell;
    }
    
    
}

