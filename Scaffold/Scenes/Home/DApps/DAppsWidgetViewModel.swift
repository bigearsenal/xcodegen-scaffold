import Foundation

final class DAppsWidgetViewModel: ObservableObject {
    // MARK: - Dependencies

    private let widgetsManager: WidgetsManager

    // MARK: - Properties

    @Published var widgets: [any Widget] = []

    // MARK: - Initializer

    init(widgetsManager: WidgetsManager) {
        self.widgetsManager = widgetsManager

        widgetsManager.widgetsPublisher
            .assign(to: &$widgets)
    }

    // MARK: - Methods
}
