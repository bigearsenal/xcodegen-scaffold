import Foundation

@MainActor
final class MainViewModel: ObservableObject {
    @Published var isLoggedIn = false
}
