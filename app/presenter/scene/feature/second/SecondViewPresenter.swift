import Foundation

class SecondViewPresenter {
    
    let view: SecondView
		let githubApi: UrlSessionGithubService
    let persistence: PersistenceService
    var nameFromParam: String?
    
		init(githubApi: UrlSessionGithubService, persistence: PersistenceService, view: SecondView, nameFromParam: String?) {
				self.githubApi = githubApi
        self.persistence = persistence
        self.view = view
        self.nameFromParam = nameFromParam
    }
    
    func load() {
        presentNameFromParam()
        presentNameFromPersistence()
				loadGithubRepositories()
    }
	
	
		func presentNameFromParam() {
        guard let nameFromParam = nameFromParam, !nameFromParam.isEmpty else {
            view.showError(with: "Error getting user name from param")
            return
        }
			
        let message = "\(nameFromParam) (from param)"
        view.setNameFromParam(message)
    }
	
    func presentNameFromPersistence() {
        guard let nameFromPersistence = persistence.getUserName(), !nameFromPersistence.isEmpty else {
            view.showError(with: "Error getting user name from persistence")
            return
        }
			
        let message = "\(nameFromPersistence) (from persistence)"
        view.setNameFromPersistence(message)
    }
	
		func loadGithubRepositories() {
			guard let username = nameFromParam, !username.isEmpty else {
				return
			}
			
			githubApi.getRepos(userName: username)
		}
}
