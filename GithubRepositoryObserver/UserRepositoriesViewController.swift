//
//  UserRepositoriesViewController.swift
//  GithubRepositoryObserver
//
//  Created by Daniel Pustotin on 27.05.2021.
//

import UIKit

class UserRepositoriesViewController: UIViewController {

	@IBOutlet weak var reposTableView: UITableView!

	// current user
	var user = User()

	override func viewDidLoad() {
		super.viewDidLoad()

		title = user.username

		self.reposTableView.rowHeight = 190.0

		// request users repos only once
		requestReposList(for: user, completion: {
			self.reposTableView.reloadData()
		})
	}
}

// MARK: VC extensions for UITableView
extension UserRepositoriesViewController: UITableViewDataSource{

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return reposList.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepoCell

		cell.name.text = reposList[indexPath.row].name
		cell.forks.text = String(reposList[indexPath.row].forks)
		cell.issues.text = String(reposList[indexPath.row].issues)
		cell.watchers.text = String(reposList[indexPath.row].watchers)
		return cell
	}
}
