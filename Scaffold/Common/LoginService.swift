import Combine
import Foundation

public let loggedInSubject = CurrentValueSubject<Bool, Never>(false)

public var loggedInPublisher: AnyPublisher<Bool, Never> {
    loggedInSubject.receive(on: RunLoop.main).eraseToAnyPublisher()
}

public var isLoggedIn: Bool { loggedInSubject.value }

public let pincodeAuthorizedSubject = CurrentValueSubject<Bool, Never>(false)

public var pincodeAuthorizedPublisher: AnyPublisher<Bool, Never> {
    pincodeAuthorizedSubject.receive(on: RunLoop.main).eraseToAnyPublisher()
}
