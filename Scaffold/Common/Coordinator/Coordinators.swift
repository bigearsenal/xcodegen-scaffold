import Foundation
import SwiftUI

/// SwiftUI EnvironmentKey
public class ActiveCoordinator: EnvironmentKey {
    public var current: (any Coordinator)?

    public static var defaultValue: ActiveCoordinator? {
        nil
    }

    public init(current: (any Coordinator)? = nil) {
        self.current = current
    }
}

/// SwiftUI EnvironmentValues
public extension EnvironmentValues {
    var activeCoordinator: ActiveCoordinator? {
        get { self[ActiveCoordinator.self] }
        set { self[ActiveCoordinator.self] = newValue }
    }
}
