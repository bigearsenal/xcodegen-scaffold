import Combine
import Foundation

public let loggedInSubject = CurrentValueSubject<Bool, Never>(false)

public var loggedInPublisher: AnyPublisher<Bool, Never> {
    loggedInSubject.receive(on: RunLoop.main).eraseToAnyPublisher()
}
