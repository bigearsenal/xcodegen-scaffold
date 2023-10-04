import Foundation

public protocol LoginService {
    var username: String { get }
    func login() async throws
}

public final class LoginServiceImpl: LoginService {
    public init() {}

    public var username: String {
        "Real username"
    }

    public func login() async throws {
        // Logics here
        print("Real service")
    }
}

public final class MockLoginService: LoginService {
    public init() {}

    public var username: String {
        "Mock username"
    }

    public func login() async throws {
        // Logics here
        print("Mocking service")
    }
}
