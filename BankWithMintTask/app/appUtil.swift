//
//  appUtil.swift
//  BankWithMintTask
//
//  Created by CWG Mobile Dev on 10/09/2020.
//  Copyright © 2020 css. All rights reserved.
//

import Foundation
import UIKit

class AppUtil {
    func showDismissAlert(title:String, message:String, confirmAction:UIAlertAction? = nil,
                        cancelAction:UIAlertAction? = nil, controller:UIViewController){
             let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
             
             //the cancel action doing nothing
             var cancel:UIAlertAction?
             if cancelAction == nil{
                 cancel = UIAlertAction(title: "Dismiss", style: .cancel) { (_) in }
             }else{
                 cancel = cancelAction
             }
             
             //adding the action to dialogbox
             alertController.addAction(cancel!)
             
             
             //finally presenting the dialog box
             controller.present(alertController, animated: true, completion: nil)
         }
}
