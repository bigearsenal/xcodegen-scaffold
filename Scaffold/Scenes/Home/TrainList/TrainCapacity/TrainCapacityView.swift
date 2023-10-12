import Common
import Stinsen
import SwiftUI

struct TrainCapacityView: View {
    @EnvironmentObject private var coordinator: TrainListCoordinator.Router
    @StateObject private var viewModel: TrainCapacityViewModel
    @State private var showingAlert = false
    @State private var isConfirming = false

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
                Text("Present modal")
            })

            Button(action: {
                coordinator.route(to: \.trainDetail, trains[0])
            }, label: {
                Text("Push")
            })

            Button(action: {
                showingAlert = true
            }, label: {
                Text("Custom Alert")
            })

            Button(action: {
                isConfirming = true
            }, label: {
                Text("ConfirmationDialog")
            })
        }
        .alert(
            "Sth",
            isPresented: $showingAlert,
            actions: {
                Button {
                    showingAlert = false
                } label: {
                    Text("OK")
                }
            }
        )
        .confirmationDialog(
            "Sth",
            isPresented: $isConfirming,
            actions: {
                Button {
                    isConfirming = false
                } label: {
                    Text("OK")
                }
            }
        )
        .task {
            try? await viewModel.load()
        }
    }
}

#Preview {
    TrainCapacityView(capacity: 101)
}
