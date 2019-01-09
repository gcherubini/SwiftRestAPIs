import UIKit


protocol SecondViewDelegate: class {
    func populateRepos(_ repos: [Repository])
    func showError(with message: String)
}

class SecondViewController: UIViewController {
	
	@IBOutlet weak var secondView: SecondView!
	var presenter: SecondViewPresenter!

    override func viewDidLoad() {
			super.viewDidLoad()
			presenter.load()
    }
}

extension SecondViewController: SecondViewDelegate {
	func populateRepos(_ repos: [Repository]) {
		secondView.loadRepos(with: repos)
	}
}
