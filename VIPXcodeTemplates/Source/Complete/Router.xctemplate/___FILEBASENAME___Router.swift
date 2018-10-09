import UIKit

protocol ___VARIABLE_sceneName___RoutingLogic {
    func routeToSomewhere(identifier: ___VARIABLE_sceneName___.Something.DataPassing)
}

protocol ___VARIABLE_sceneName___DataPassing {
    var dataStore: ___VARIABLE_sceneName___DataStore? { get }
}

class ___VARIABLE_sceneName___Router: NSObject, ___VARIABLE_sceneName___DataPassing {
    weak var viewController: ___VARIABLE_sceneName___ViewController?
    var dataStore: ___VARIABLE_sceneName___DataStore?

}

extension ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RoutingLogic {
    
    func routeToSomewhere(identifier: ___VARIABLE_sceneName___.Something.DataPassing) {
        
    }

}
