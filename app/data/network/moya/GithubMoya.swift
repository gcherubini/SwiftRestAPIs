import Foundation
import Moya

public enum GithubMoya {
	case users
	case repos(userName: String)
}

extension Marvel: TargetType {
	var baseURL: URL {
		return URL(string: "https://api.github.com")!
	}
	
	var path: String {
		switch self {
		case .users:
			return "/users"
		case .repos(let userName):
			return "/users/\(userName)/repos"
		}
	}
	
	var method: Moya.Method {
		switch self {
		case .users:
			return .get
		case .repos(let userName):
			return .get
		}
	}
	
	var sampleData: Data {
		return Data()
	}
	
	var task: Task {
		
		switch self {
		case .comics:
			// 3
			return .requestParameters(
				parameters: ["param": "value"],
				encoding: URLEncoding.default)
		}
	}
	
	var headers: [String: String]? {
		return ["Content-Type": "application/json"]
	}
	
	var validationType: ValidationType {
		return .successCodes
		/* validationType is used to provide your definition of a successful API request.
		There are many options available and, in your case, you’ll simply use .successCodes which means a request
		will be deemed successful if its HTTP code is between 200 and 299.
		*/
	}
}
