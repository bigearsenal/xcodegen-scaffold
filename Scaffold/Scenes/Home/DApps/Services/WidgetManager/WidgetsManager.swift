import Combine
import Foundation

protocol WidgetsManager {
    var widgetsPublisher: AnyPublisher<[any Widget], Never> { get }
}
