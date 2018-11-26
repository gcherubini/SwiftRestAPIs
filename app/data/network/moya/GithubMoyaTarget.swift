import Foundation
import Moya

public enum GithubMoyaTarget {
	case users
	case repos(userName: String)
}

extension GithubMoyaTarget: TargetType {
	public var baseURL: URL {
		return URL(string: "https://api.github.com")!
	}
	
	public var path: String {
		switch self {
		case .users:
			return "/users"
		case .repos(let userName):
			return "/users/\(userName)/repos"
		}
	}
	
	public var method: Moya.Method {
		switch self {
		case .users:
			return .get
		case .repos(_):
			return .get
		}
	}
	
	public var sampleData: Data {
		return Data()
	}
	
	public var task: Task {
		switch self {
		case .users:
			return .requestPlain
		case .repos:
			return .requestPlain
//			return .requestParameters(
//				parameters: ["param": "value"],
//				encoding: URLEncoding.default)
		}
	}
	
	public var headers: [String: String]? {
		return ["Content-Type": "application/json"]
	}
	
	public var validationType: ValidationType {
		return .successCodes
		/* validationType is used to provide your definition of a successful API request.
		There are many options available and, in your case, you’ll simply use .successCodes which means a request
		will be deemed successful if its HTTP code is between 200 and 299.
		*/
	}
}
