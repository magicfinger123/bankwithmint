//
//  errorMessage.swift
//  BankWithMintTask
//
//  Created by CWG Mobile Dev on 10/09/2020.
//  Copyright © 2020 css. All rights reserved.
//

import Foundation

// MARK: - ErrorMessage
class ErrorMessage: Codable {
    let message: String?
    let documentationUrl: String?

    enum CodingKeys: String, CodingKey {
        case message
        case documentationUrl = "documentation_url"
    }

    init(message: String?, documentationUrl: String?) {
        self.message = message
        self.documentationUrl = documentationUrl
    }
}

