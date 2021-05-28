//
//  Cells.swift
//  GithubRepositoryObserver
//
//  Created by Daniel Pustotin on 27.05.2021.
//

import UIKit

class UserCell: UITableViewCell {

	@IBOutlet weak var usernameLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}
}

class RepoCell: UITableViewCell {

	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var forks: UILabel!
	@IBOutlet weak var watchers: UILabel!
	@IBOutlet weak var issues: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}
}
