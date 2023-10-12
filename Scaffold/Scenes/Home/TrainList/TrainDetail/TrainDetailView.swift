import Common
import Stinsen
import SwiftUI

struct TrainDetailView: View {
    @EnvironmentObject private var trainListCoordinator: TrainListCoordinator.Router
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
                        trainListCoordinator.route(to: \.trainCapacity, train.capacity)
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
