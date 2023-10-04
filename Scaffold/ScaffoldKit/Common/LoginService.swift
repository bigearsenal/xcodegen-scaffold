import Foundation

public protocol LoginService {
    func login() async throws
}

public final class LoginServiceImpl: LoginService {
    public init() {}

    public func login() async throws {
        // Logics here
        print("Real service")
    }
}

public final class MockLoginService: LoginService {
    public init() {}

    public func login() async throws {
        // Logics here
        print("Mocking service")
    }
}
