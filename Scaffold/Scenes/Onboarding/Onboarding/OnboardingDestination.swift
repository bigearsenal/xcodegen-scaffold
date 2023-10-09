import Foundation

public enum OnboardingDestination: String, Identifiable {
    public var id: String {
        rawValue
    }

    case login
    case signUp
}
