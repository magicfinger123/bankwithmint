//
//  githubApiModel.swift
//  BankWithMintTask
//
//  Created by CWG Mobile Dev on 09/09/2020.
//  Copyright © 2020 css. All rights reserved.
//

import Foundation

// MARK: - RequestByUserElement
class RequestByUserElement: Codable {
    let sha, nodeId: String?
    let commit: Commit?
    let url, htmlUrl, commentsUrl: String?
    let author, committer: RequestByUserAuthor?
    let parents: [Parent]?

    enum CodingKeys: String, CodingKey {
        case sha
        case nodeId = "node_id"
        case commit, url
        case htmlUrl = "html_url"
        case commentsUrl = "comments_url"
        case author, committer, parents
    }

    init(sha: String?, nodeId: String?, commit: Commit?, url: String?, htmlUrl: String?, commentsUrl: String?, author: RequestByUserAuthor?, committer: RequestByUserAuthor?, parents: [Parent]?) {
        self.sha = sha
        self.nodeId = nodeId
        self.commit = commit
        self.url = url
        self.htmlUrl = htmlUrl
        self.commentsUrl = commentsUrl
        self.author = author
        self.committer = committer
        self.parents = parents
    }
}

// MARK: - RequestByUserAuthor
class RequestByUserAuthor: Codable {
    let login: String?
    let id: Int?
    let nodeId: String?
    let avatarUrl: String?
    let gravatarId: String?
    let url, htmlUrl, followersUrl: String?
    let followingUrl, gistsUrl, starredUrl: String?
    let subscriptionsUrl, organizationsUrl, reposUrl: String?
    let eventsUrl: String?
    let receivedEventsUrl: String?
    let type: String?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }

    init(login: String?, id: Int?, nodeId: String?, avatarUrl: String?, gravatarId: String?, url: String?, htmlUrl: String?, followersUrl: String?, followingUrl: String?, gistsUrl: String?, starredUrl: String?, subscriptionsUrl: String?, organizationsUrl: String?, reposUrl: String?, eventsUrl: String?, receivedEventsUrl: String?, type: String?, siteAdmin: Bool?) {
        self.login = login
        self.id = id
        self.nodeId = nodeId
        self.avatarUrl = avatarUrl
        self.gravatarId = gravatarId
        self.url = url
        self.htmlUrl = htmlUrl
        self.followersUrl = followersUrl
        self.followingUrl = followingUrl
        self.gistsUrl = gistsUrl
        self.starredUrl = starredUrl
        self.subscriptionsUrl = subscriptionsUrl
        self.organizationsUrl = organizationsUrl
        self.reposUrl = reposUrl
        self.eventsUrl = eventsUrl
        self.receivedEventsUrl = receivedEventsUrl
        self.type = type
        self.siteAdmin = siteAdmin
    }
}

// MARK: - Commit
class Commit: Codable {
    let author, committer: CommitAuthor?
    let message: String?
    let tree: Tree?
    let url: String?
    let commentCount: Int?
    let verification: Verification?

    enum CodingKeys: String, CodingKey {
        case author, committer, message, tree, url
        case commentCount = "comment_count"
        case verification
    }

    init(author: CommitAuthor?, committer: CommitAuthor?, message: String?, tree: Tree?, url: String?, commentCount: Int?, verification: Verification?) {
        self.author = author
        self.committer = committer
        self.message = message
        self.tree = tree
        self.url = url
        self.commentCount = commentCount
        self.verification = verification
    }
}

// MARK: - CommitAuthor
class CommitAuthor: Codable {
    let name, email: String?
    let date: String?

    init(name: String?, email: String?, date: String?) {
        self.name = name
        self.email = email
        self.date = date
    }
}

// MARK: - Tree
class Tree: Codable {
    let sha: String?
    let url: String?

    init(sha: String?, url: String?) {
        self.sha = sha
        self.url = url
    }
}

// MARK: - Verification
class Verification: Codable {
    let verified: Bool?
    let reason: String?
    let signature, payload: String?

    init(verified: Bool?, reason: String?, signature: String?, payload: String?) {
        self.verified = verified
        self.reason = reason
        self.signature = signature
        self.payload = payload
    }
}

// MARK: - Parent
class Parent: Codable {
    let sha: String?
    let url, htmlUrl: String?

    enum CodingKeys: String, CodingKey {
        case sha, url
        case htmlUrl = "html_url"
    }

    init(sha: String?, url: String?, htmlUrl: String?) {
        self.sha = sha
        self.url = url
        self.htmlUrl = htmlUrl
    }
}

typealias RequestByUser = [RequestByUserElement]

// MARK: - Encode/decode helpers



