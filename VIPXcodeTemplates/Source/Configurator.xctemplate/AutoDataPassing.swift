import Foundation
import UIKit

protocol AutoDataPassing: class {
    associatedtype RouterType
    
    var router: RouterType? { get }
    
}

extension AutoDataPassing where Self: UIViewController {
    
    func doDataPassing(for segue: UIStoryboardSegue, sender: Any?) {
        prepareSegue(segue, sender: sender, using: router)
    }

    private func prepareSegue(_ segue: UIStoryboardSegue, sender: Any?, using router: RouterType?) {
        if let scene = segue.identifier, let object = router as? NSObjectProtocol {
            let selector = NSSelectorFromString("passDataTo\(scene)WithSegue:sender:")
            if object.responds(to: selector) {
                object.perform(selector, with: segue, with: sender)
            }
        }
    }

}
