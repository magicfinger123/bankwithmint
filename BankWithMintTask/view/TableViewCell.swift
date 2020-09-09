//
//  TableViewCell.swift
//  BankWithMintTask
//
//  Created by CWG Mobile Dev on 09/09/2020.
//  Copyright © 2020 css. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var authorName: UILabel!
    
    @IBOutlet var authorEmail: UILabel!
    
    @IBOutlet var commitDate: UILabel!
    
    @IBOutlet var commitMesaage: UILabel!
    
    func setCommits(commit:RequestByUserElement) {
        authorName.text = commit.commit?.author?.name
        authorEmail.text = commit.commit?.author?.email
        commitDate.text = commit.commit?.author?.date
        commitMesaage.text = commit.commit?.message
    }
}
