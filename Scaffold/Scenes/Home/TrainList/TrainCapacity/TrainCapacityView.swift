import ComposableNavigator
import SwiftUI

struct TrainCapacityView: View {
    @Environment(\.navigator) private var navigator
    @Environment(\.currentScreen) private var currentScreen

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
        }
        .navigationBarItems(
            trailing: Button(
                action: { navigator.dismiss(screen: currentScreen) },
                label: { Image(systemName: "xmark") }
            )
        )
        .navigationTitle(Text("Capacity"))
        .task {
            try? await viewModel.load()
        }
    }
}

#Preview {
    TrainCapacityView(capacity: 101)
}
