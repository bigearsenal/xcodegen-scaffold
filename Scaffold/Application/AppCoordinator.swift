import Combine
import Common
import Foundation
import Home
import Onboarding
import PinCode
import Settings
import Stinsen
import SwiftUI

final class AppCoordinator: NavigationCoordinatable {
    // MARK: - Routes

    @Root var onboarding = makeOnboarding
    @Root var pincode = makePinCode
    @Root var home = makeHome

    // MARK: - Properties

    var stack: Stinsen.NavigationStack<AppCoordinator>
    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initializer

    init() {
        if !isLoggedIn {
            stack = NavigationStack(initial: \AppCoordinator.onboarding)
        } else if !pincodeAuthorizedSubject.value {
            stack = NavigationStack(initial: \AppCoordinator.pincode)
        } else {
            stack = NavigationStack(initial: \AppCoordinator.home)
        }

        Publishers.CombineLatest(
            loggedInPublisher,
            pincodeAuthorizedPublisher
        )
        .sink { [weak self] isLoggedIn, pincodeEntered in
            if !isLoggedIn {
                self?.root(\.onboarding)
            } else if !pincodeEntered {
                self?.root(\.pincode)
            } else {
                self?.root(\.home)
            }
        }
        .store(in: &subscriptions)
    }

    // MARK: - Customize

    public func customize(_ view: AnyView) -> some View {
        // To test deeplink: `xcrun simctl openurl booted "scaffolddl://settings"`
        view
            .onOpenURL(perform: { url in
                // Deeplink for home

                if let coordinator = self.hasRoot(\.home) {
                    do {
                        let deepLink = try DeepLink(url: url)
                        self.popToRoot()
                        switch deepLink {
                        case .settings:
                            let settingsCoordinator = coordinator
                                .focusFirst(\.settings)
                                .child
                                .popToRoot()

                            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                                settingsCoordinator
                                    .route(to: \SettingsCoordinator.profile)
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            })
    }

    // MARK: - Builders

    func makeHome() -> HomeCoordinator {
        .init()
    }

    func makeOnboarding() -> NavigationViewCoordinator<OnboardingCoordinator> {
        .init(.init())
    }

    @ViewBuilder func makePinCode() -> some View {
        PinCodeView()
    }
}
