import Foundation
import UIKit

struct FeatureSceneFactory {
    static func makeFirstScene(delegate: FirstViewPresenterDelegate?) -> FirstViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let persistence = PersistenceService()
        let presenter = FirstViewPresenter(persistence: persistence, view: viewController, delegate: delegate)
        viewController.presenter = presenter
        return viewController
    }
    
    static func makeSecondScene(userName: String?) -> SecondViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
				let githubApi = UrlSessionGithubService()
				let githubMoyaProvider = GithubMoyaProvider()
        let persistence = PersistenceService()
				let presenter = SecondViewPresenter(githubApi: githubApi, githubMoyaProvider: githubMoyaProvider, persistence: persistence, view: viewController, nameFromParam: userName)
        viewController.presenter = presenter
        return viewController
    }
}
