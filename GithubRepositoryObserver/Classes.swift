//
//  Classes.swift
//  GithubRepositoryObserver
//
//  Created by Daniel Pustotin on 27.05.2021.
//

import Foundation
import UIKit

class User {
	@objc dynamic var username = String()
	@objc dynamic var name = String()
	@objc dynamic var reposAPI = String()
}

class Repository {
	@objc dynamic var name = String()
	@objc dynamic var watchers = 0
	@objc dynamic var forks = 0
	@objc dynamic var issues = 0
}
