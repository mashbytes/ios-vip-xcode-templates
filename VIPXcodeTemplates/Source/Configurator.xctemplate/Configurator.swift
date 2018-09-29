import Foundation
import UIKit

protocol Configurator {
    associatedtype TargetType
    
    func configure(_ target: TargetType)
}

