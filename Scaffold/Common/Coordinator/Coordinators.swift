import Foundation
import SwiftUI

/// Coordinator object that is stored on environmentValues
public class Coordinators {
    // MARK: - Properties

    /// Indicate if debug should be logged
    private let debug: Bool

    /// Array of fired coordinator, sorted by time added to stack
    public var coordinators: [any Coordinator] = []

    /// Last coordinator of the current stack
    public var last: (any Coordinator)? {
        coordinators.last
    }

    // MARK: - Initializer

    public init(debug: Bool = false) {
        self.debug = debug
    }

    // MARK: - Methods

    func append(_ coordinator: any Coordinator) {
        coordinators.append(coordinator)

        if debug {
            print("[Coordinator] added \(String(reflecting: coordinator))")
        }
    }

    func popLast() {
        let poppedCoordinator = coordinators.popLast()

        if debug {
            print("[Coordinator] popped \(String(reflecting: poppedCoordinator))")
        }
    }

    func removeAll() {
        coordinators.removeAll()

        if debug {
            print("[Coordinator] removed all")
        }
    }
}

/// SwiftUI EnvironmentKey
extension Coordinators: EnvironmentKey {
    public static var defaultValue: Coordinators {
        .init()
    }
}

/// SwiftUI EnvironmentValues
public extension EnvironmentValues {
    var coordinators: Coordinators {
        get { self[Coordinators.self] }
        set { self[Coordinators.self] = newValue }
    }
}
