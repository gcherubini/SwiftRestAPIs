import Foundation
import UIKit

class SecondView: UIView {
	@IBOutlet private var contentView: UIView!
	@IBOutlet weak var tableView: UITableView!
	private var repos = [Repository]()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		Bundle.main.loadNibNamed("SecondView", owner: self, options: nil)
		addSubview(contentView)
		contentView.frame = self.bounds
	}
}

extension SecondView: UITableViewDelegate, UITableViewDataSource {
	func loadRepos(with repos: [Repository]) {
		self.repos = repos
		tableView.reloadData()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return repos.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		//let cell = tableView.dequeueReusableCell(withIdentifier: "SecondViewTableCell", for: indexPath)
		let cell = Bundle.main.loadNibNamed("SecondViewTableCell", owner: self, options: nil)?.first as! SecondViewTableCell
		cell.setLabel(text: repos[indexPath.row].name)
		return cell
	}
}
