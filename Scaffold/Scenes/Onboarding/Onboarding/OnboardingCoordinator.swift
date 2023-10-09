import Common
import Foundation

public class OnboardingCoordinator: PresentingCoordinator {
    // MARK: - Properties

    var viewModel: OnboardingViewModel!
    public let id: String = UUID().uuidString
    @Published public var presenting: OnboardingDestination?

    public init() {
        viewModel = .init(coordinator: self)
    }
}
