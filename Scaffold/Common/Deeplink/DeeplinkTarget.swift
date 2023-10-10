import Foundation

public enum DeeplinkTarget: Equatable {
    case home
    case details(reference: String)
}
