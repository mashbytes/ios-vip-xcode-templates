import UIKit

protocol ___VARIABLE_sceneName___PresentationLogic {
    func presentSomething(response: ___VARIABLE_sceneName___.Something.Response)
}

class ___VARIABLE_sceneName___Presenter {
    weak var display: ___VARIABLE_sceneName___DisplayLogic?
  
}

extension ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___PresentationLogic {
    
    func presentSomething(response: ___VARIABLE_sceneName___.Something.Response) {
        let viewModel = ___VARIABLE_sceneName___.Something.ViewModel()
        display?.displaySomething(viewModel: viewModel)
    }

}
