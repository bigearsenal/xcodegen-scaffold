import Foundation

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var isLoggedIn = false
}
