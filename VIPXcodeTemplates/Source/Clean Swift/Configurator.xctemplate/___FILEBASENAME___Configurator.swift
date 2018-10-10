import UIKit


class ___VARIABLE_sceneName___Configurator: ControllerConfigurator {

    func configure(_ target: ___VARIABLE_sceneName___ViewController) {
        let interactor = ___VARIABLE_sceneName___Interactor()
        let presenter = ___VARIABLE_sceneName___Presenter()
        let router = ___VARIABLE_sceneName___Router()
        target.interactor = interactor
        target.router = router
        interactor.presenter = presenter
        presenter.display = target
        router.viewController = target
        router.dataStore = interactor
    }

}

