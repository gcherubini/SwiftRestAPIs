import UIKit

protocol FirstView: class {
    func setTextFieldHint(_ hint: String)
    func setButtonText(_ text: String)
    func showError(with message: String)
}

class FirstViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var presenter: FirstViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
    @IBAction func onPrimaryBtnClick(_ sender: UIButton) {
        presenter.persist(userName: nameTextField.text)
    }
}

extension FirstViewController: FirstView {

    func setTextFieldHint(_ hint: String) {
        nameTextField.placeholder = hint
    }
    
    func setButtonText(_ text: String) {
        submitButton.setTitle(text, for: .normal)
    }
    
}
