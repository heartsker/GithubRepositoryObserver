//
//  API.swift
//  GithubRepositoryObserver
//
//  Created by Daniel Pustotin on 27.05.2021.
//

import Foundation
import Alamofire

// Data sources for talbes
var usersList = [User]()
var reposList = [Repository]()

// Request for users list
func requestUsersList(pattern: String, completion: @escaping () -> Void) {

	usersList = []
	DispatchQueue.main.async {
		completion()
	}

	let url = "https://api.github.com/search/users?q=\(pattern)%20in%3Auser"
	AF.request(url).responseJSON(completionHandler: { response in
		if let data = response.value as? [String : Any],
		   let jsonDict = data["items"] as? [NSDictionary] {
			for item in jsonDict {
				let user = User()
				user.username = item["login"] as! String
				user.name = item["name"] as? String ?? "None"
				user.reposAPI = item["repos_url"] as! String

				usersList.append(user)
				DispatchQueue.main.async {
					completion()
				}
			}
		}
	})
}

// Request for users repos list
func requestReposList(for user: User, completion: @escaping () -> Void) {

	reposList = []
	DispatchQueue.main.async {
		completion()
	}

	let url = user.reposAPI
	print(url)
	AF.request(url).responseJSON(completionHandler: { response in
		if let data = response.value as! [NSDictionary]? {
			let jsonDict = data
			for item in jsonDict {
				let repo = Repository()
				repo.name = item["name"] as! String
				repo.watchers = item["watchers"] as! Int
				repo.issues = item["open_issues"] as! Int
				repo.forks = item["forks"] as! Int

				print(repo.name)
				print(repo.forks)
				print(repo.watchers)
				print(repo.issues)

				reposList.append(repo)
				DispatchQueue.main.async {
					completion()
				}
			}
		}
	})
}
