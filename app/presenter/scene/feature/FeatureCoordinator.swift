import UIKit

class FeatureCoordinator: Coordinator {

    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        showFirstScene()
    }
}

extension FeatureCoordinator {
    func showFirstScene() {
        let scene = FeatureSceneFactory.makeFirstScene(delegate: self)
			navigationController.viewControllers = [scene]
    }
    
    func showSecondScene(userName: String) {
        let scene = FeatureSceneFactory.makeSecondScene(userName: userName)
        navigationController.pushViewController(scene, animated: true)
    }
}

extension FeatureCoordinator: FirstViewPresenterDelegate {
    func didEnterName(_ userName: String) {
        showSecondScene(userName: userName)
    }
}
