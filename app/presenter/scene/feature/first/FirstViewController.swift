import UIKit

protocol FirstViewDelegate: class {
    func setTextFieldHint(_ hint: String)
    func setButtonText(_ text: String)
    func showError(with message: String)
}

class FirstViewController: UIViewController {
	
	var presenter: FirstViewPresenter!
	@IBOutlet weak var firstView: FirstView!
	
	override func viewDidLoad() {
			super.viewDidLoad()
			firstView.button.addTarget(self, action: #selector(onPrimaryBtnClick), for: .touchUpInside)

			presenter.load()
	}
	
	@objc func onPrimaryBtnClick(sender: UIButton!) {
			presenter.persist(userName: firstView.input.text)
	}
}

extension FirstViewController: FirstViewDelegate {

	func setTextFieldHint(_ hint: String) {
			firstView.input.placeholder = hint
	}
	
	func setButtonText(_ text: String) {
			firstView.button.setTitle(text, for: .normal)
	}
}
