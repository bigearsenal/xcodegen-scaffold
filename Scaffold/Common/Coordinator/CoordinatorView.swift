import SwiftUI

/// CoordinatorView that handle navigation for a View
public struct CoordinatorView<Coord: Coordinator, Content: View>: View {
    // MARK: - Environment

    @Environment(\.coordinators) private var coordinators

    // MARK: - Properties

    @ObservedObject public var coordinator: Coord
    private let content: () -> Content

    // MARK: - Initializer

    public init(coordinator: Coord, @ViewBuilder content: @escaping () -> Content) {
        self.coordinator = coordinator
        self.content = content
    }

    public var body: some View {
        content()
            .onAppear {
                coordinators.append(coordinator)
            }
            .onDisappear {
                coordinators.popLast()
            }
    }
}
