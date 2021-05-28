//
//  ViewController.swift
//  GithubRepositoryObserver
//
//  Created by Daniel Pustotin on 27.05.2021.
//

import UIKit

class UserSearchViewController: UIViewController {

	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var usersTableView: UITableView!

	var timer = Timer()
	var username: String = ""

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		usersTableView.delegate = self
	}

	// MARK: Start the timer
	override func viewDidAppear(_ animated: Bool) {
		timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUsername), userInfo: nil, repeats: true)
	}

	// MARK: Request users list for pattern for every timer tick
	@objc func updateUsername() {
		if usernameTextField.text != nil, username != usernameTextField.text, !usernameTextField.text!.isEmpty {
			username = usernameTextField.text!
			requestUsersList(pattern: username, completion: {
				self.usersTableView.reloadData()
			})

			print(username)
		}
	}

	// MARK: Invalidate the timer
	override func viewWillDisappear(_ animated: Bool) {
		timer.invalidate()
	}
}

// MARK: VC extensions for UITableView
extension UserSearchViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return usersList.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell

		cell.usernameLabel.text = usersList[indexPath.row].username
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


		let controller = storyboard?.instantiateViewController(identifier: "UserRepositoriesViewController") as! UserRepositoriesViewController

		controller.user = usersList[indexPath.row]

		self.navigationController?.pushViewController(controller, animated: true)
	}
}

