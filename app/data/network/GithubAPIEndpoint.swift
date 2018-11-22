import Foundation

enum GithubAPIEndpoint {
	case users
	case repos(userName: String)
	
	var api : String {
		return "https://api.github.com"
	}
	
	var path: String {
		switch self {
		case .users:
			return "\(api)/users"
		case .repos(let userName):
			return "\(api)/users/\(userName)/repos"
		}
	}
}
