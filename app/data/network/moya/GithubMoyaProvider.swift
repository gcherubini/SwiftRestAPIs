import Foundation
import Moya

class GithubMoyaProvider {
	func getRepos(userName: String) {
		print("GithubMoyaProvider - getRepos for: \(userName)")

		let provider = MoyaProvider<GithubMoyaTarget>()
		provider.request(.repos(userName: userName)) { result in			
			switch result {
			case .success(let response):
				do {
					print("GithubService - success \(try response.mapJSON())")
				} catch {
					print("GithubService - error")
				}
			case .failure:
				print("GithubService - failure")
			}
		}
	}
}
