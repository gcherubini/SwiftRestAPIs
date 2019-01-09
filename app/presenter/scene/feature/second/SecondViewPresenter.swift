import Foundation
import RxSwift
import RxCocoa

class SecondViewPresenter {
    
    let view: SecondViewDelegate
		let githubApi: UrlSessionGithubService
		let githubMoyaProvider: GithubMoyaProvider
    let persistence: PersistenceService
    var nameFromParam: String?
    
		init(githubApi: UrlSessionGithubService, githubMoyaProvider: GithubMoyaProvider, persistence: PersistenceService, view: SecondViewDelegate, nameFromParam: String?) {
				self.githubApi = githubApi
				self.githubMoyaProvider = githubMoyaProvider
        self.persistence = persistence
        self.view = view
        self.nameFromParam = nameFromParam
    }
    
    func load() {
        presentNameFromParam()
        presentNameFromPersistence()
				observeRepositories()
				loadGithubRepositories(with: nameFromParam)
    }
	
		private func presentNameFromParam() {
        guard let nameFromParam = nameFromParam, !nameFromParam.isEmpty else {
            view.showError(with: "Error getting user name from param")
            return
        }
			
        let message = "\(nameFromParam) (from param)"
        view.setNameFromParam(message)
    }
	
    private func presentNameFromPersistence() {
        guard let nameFromPersistence = persistence.getUserName(), !nameFromPersistence.isEmpty else {
            view.showError(with: "Error getting user name from persistence")
            return
        }
			
        let message = "\(nameFromPersistence) (from persistence)"
        view.setNameFromPersistence(message)
    }
	
		private func loadGithubRepositories(with userName: String?) {
			guard let userName = userName, !userName.isEmpty else {
				return
			}
			
			githubApi.getRepos(userName: userName)
			//githubMoyaProvider.getRepos(userName: userName)
		}
	
		private func observeRepositories() {
			githubApi.repositoriesVariable.asObservable()
				// If the code is updating the UI all changes needs to be made in the main tread.
				// To make sure the completion block is run in the UIThread: MainScheduler.instance
				.observeOn(MainScheduler.instance)
				.subscribe(onNext: { repositories in
					print("--> \(repositories)")
				})
				//.disposed(by: disposeBag)
		}
}
