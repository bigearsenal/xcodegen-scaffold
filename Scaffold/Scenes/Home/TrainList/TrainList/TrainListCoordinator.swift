import Common
import Foundation
import Stinsen
import SwiftUI

public final class TrainListCoordinator: NavigationCoordinatable {
    public let stack = Stinsen.NavigationStack(initial: \TrainListCoordinator.start)

    @Root private var start = makeStart
    @Route(.push) var trainDetail = makeTrainDetail
    @Route(.modal) var trainCapacity = makeTrainCapacity

    public init() {}

    deinit {
        print("Deinit \(String(reflecting: self))")
    }

    @ViewBuilder func makeStart() -> some View {
        TrainListView()
    }

    @ViewBuilder func makeTrainDetail(train: Train) -> some View {
        TrainDetailView(train: train)
    }

    @ViewBuilder func makeTrainCapacity(trainCapacity: Int) -> some View {
        TrainCapacityView_UIKit(capacity: trainCapacity)
    }
}

// Just a wrapping test
private struct TrainCapacityView_UIKit: UIViewControllerRepresentable {
    let capacity: Int

    func makeUIViewController(
        context _: Context
    ) -> UINavigationController {
        let vc = UIHostingController(rootView: TrainCapacityView(capacity: capacity))
        vc.title = "Capacity"
        let nc = UINavigationController(
            rootViewController: vc
        )
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }

    func updateUIViewController(_: UINavigationController, context _: Context) {}
}
