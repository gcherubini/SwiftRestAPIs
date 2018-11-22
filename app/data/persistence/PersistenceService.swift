import Foundation

class PersistenceService {
    
    let defaults: UserDefaults
    
    enum Keys: String {
        case userName
    }
    
    init(defaults: UserDefaults = UserDefaults()) {
        self.defaults = defaults
    }
    
    func persist(userName: String) {
        defaults.set(userName, forKey: Keys.userName.rawValue)
    }
    
    func getUserName() -> String? {
        return defaults.string(forKey: Keys.userName.rawValue)
    }
}
