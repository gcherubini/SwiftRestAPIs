import Foundation
import RxSwift
import RxCocoa

class SecondViewPresenter {
    
    let view: SecondViewDelegate
		let githubApi: UrlSessionGithubService
		let githubMoyaProvider: GithubMoyaProvider
    var nameFromParam: String?
    
		init(githubApi: UrlSessionGithubService, githubMoyaProvider: GithubMoyaProvider, view: SecondViewDelegate, nameFromParam: String?) {
				self.githubApi = githubApi
				self.githubMoyaProvider = githubMoyaProvider
        self.view = view
        self.nameFromParam = nameFromParam
    }
    
    func load() {
				observeRepositories()
				loadGithubRepositories(with: nameFromParam)
    }
	
		private func observeRepositories() {
			githubApi.repositoriesVariable.asObservable()
				// If the code is updating the UI all changes needs to be made in the main tread.
				// To make sure the completion block is run in the UIThread: MainScheduler.instance
				.observeOn(MainScheduler.instance)
				.subscribe(onNext: { [weak self] repositories in
					print("--> \(repositories)")
					
					self?.view.populateRepos([
						Repository(name: "Repo One"),
						Repository(name: "Repo Two")
						]
					)
				})
			//.disposed(by: disposeBag)
		}
	
		private func loadGithubRepositories(with userName: String?) {
			guard let userName = userName, !userName.isEmpty else {
				return
			}
			
			githubApi.getRepos(userName: userName)
			//githubMoyaProvider.getRepos(userName: userName)
		}
}
