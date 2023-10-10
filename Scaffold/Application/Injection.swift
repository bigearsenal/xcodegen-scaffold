import Common
import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        Resolver.register {
            LoginServiceImpl()
        }
        .implements(LoginService.self)
    }
}
