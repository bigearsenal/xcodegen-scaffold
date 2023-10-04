import Foundation
import Resolver

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var isLoggedIn = false
}
