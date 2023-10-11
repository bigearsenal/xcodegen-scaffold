import Common
import ComposableNavigator
import SwiftUI

struct TrainDetailView: View {
    @Environment(\.navigator) private var navigator
    @Environment(\.currentScreen) private var currentScreen
    @StateObject private var viewModel: TrainDetailViewModel

    init(id: Int) {
        _viewModel = .init(wrappedValue: .init(id: id))
    }

    init(train: Train) {
        _viewModel = .init(wrappedValue: .init(train: train))
    }

    var body: some View {
        VStack {
            if let train = viewModel.train {
                Text(train.name)
                    .padding()
                Button(
                    action: {
                        navigator.go(
                            to: TrainCapacityScreen(
                                capacity: train.capacity,
                                trainId: train.id
                            ),
                            on: currentScreen
                        )
                    },
                    label: { Text("Show capacity").foregroundColor(.red) }
                )
            } else {
                ProgressView()
            }
        }
        .navigationTitle(viewModel.train?.name ?? "Loading")
        .task {
            try? await viewModel.load()
        }
    }
}

#Preview {
    TrainDetailView(id: 1)
}
