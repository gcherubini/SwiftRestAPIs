import Foundation

struct RepositoryOutput: Codable {
	let name: String
	let updatedAt: String
	
	enum CodingKeys: String, CodingKey {
		case name
		case updatedAt = "updated_at"
	}
}
