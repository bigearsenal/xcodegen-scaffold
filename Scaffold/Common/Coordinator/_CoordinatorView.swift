import SwiftUI

public protocol CoordinatorView: View {
    associatedtype Content: View
    associatedtype Coord: Coordinator
    var coordinator: Coord { get }
    @ViewBuilder @MainActor var content: Self.Content { get }
}

public extension CoordinatorView {
    @ViewBuilder @MainActor var body: some View {
        _CoordinatorView(coordinator: coordinator) {
            content
        }
    }
}

/// CoordinatorView that handle navigation for a View
private struct _CoordinatorView<Coord: Coordinator, Content: View>: View {
    // MARK: - Environment

    @Environment(\.activeCoordinator) private var activeCoordinator

    // MARK: - Properties

    private var coordinator: Coord
    private let content: () -> Content

    // MARK: - Initializer

    fileprivate init(coordinator: Coord, @ViewBuilder content: @escaping () -> Content) {
        self.coordinator = coordinator
        self.content = content
    }

    fileprivate var body: some View {
        content()
            .onAppear {
                activeCoordinator?.current = coordinator
                print("activeCoordinator: \(String(reflecting: activeCoordinator?.current))")
            }
    }
}
