import Foundation

protocol FirstViewPresenterDelegate: class {
    func didEnterName(_ userName: String)
}

class FirstViewPresenter {
    
    let view: FirstViewDelegate
    let persistence: PersistenceService
    weak var delegate: FirstViewPresenterDelegate?
    
    init(persistence: PersistenceService, view: FirstViewDelegate, delegate: FirstViewPresenterDelegate?) {
        self.persistence = persistence
        self.view = view
        self.delegate = delegate
    }
    
    func load() {
        view.setButtonText("Submit!!!")
        view.setTextFieldHint("Tell me your Github user name")
		}
    
    func persist(userName: String?) {
        guard let userName = userName, !userName.isEmpty else {
            view.showError(with: "Fill field correctly!")
            return
        }
			
        persistence.persist(userName: userName)
        delegate?.didEnterName(userName)
    }
}
