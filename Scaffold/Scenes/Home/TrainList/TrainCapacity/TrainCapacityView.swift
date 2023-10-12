import Stinsen
import SwiftUI

struct TrainCapacityView: View {
    @EnvironmentObject private var coordinator: TrainListCoordinator.Router
    @StateObject private var viewModel: TrainCapacityViewModel

    init(capacity: Int) {
        _viewModel = .init(wrappedValue: .init(capacity: capacity))
    }

    init(trainId: Int) {
        _viewModel = .init(wrappedValue: .init(trainId: trainId))
    }

    var body: some View {
        VStack {
            Image(systemName: "person.3.fill")
                .imageScale(.medium)
                .padding(.bottom)
            if let capacity = viewModel.capacity {
                Text("\(capacity)")
                    .font(.largeTitle)
                    .bold()
            } else {
                ProgressView()
            }

            Button(action: {
                coordinator.route(to: \.trainCapacity, (viewModel.capacity ?? 0) + 1)
            }, label: {
                Text("Button")
            })
        }
        .task {
            try? await viewModel.load()
        }
    }
}

#Preview {
    TrainCapacityView(capacity: 101)
}
