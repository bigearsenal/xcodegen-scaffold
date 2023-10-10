import ComposableDeeplinking
import Foundation

public extension DeeplinkParser {
    /// Parses all supported deeplinks in the example app
    ///
    /// Supported deeplinks:
    /// * example://home/settings
    /// * example://detail?id={id}
    static let scaffoldApp: DeeplinkParser = .anyOf(
        .signUp
    )
}
