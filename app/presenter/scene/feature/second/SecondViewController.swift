import UIKit


protocol SecondViewDelegate: class {
    func setNameFromParam(_ text: String)
    func setNameFromPersistence(_ text: String)
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
	func setNameFromParam(_ text: String) {
		secondView.nameFromParamLabel.text = text
		secondView.nameFromParamLabel.isHidden = false
	}
	
	func setNameFromPersistence(_ text: String) {
		secondView.nameFromPersistenceLabel.text =  text
		secondView.nameFromPersistenceLabel.isHidden = false
	}
}
