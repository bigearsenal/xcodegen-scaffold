import Common
import Foundation
import Stinsen
import SwiftUI

struct TrainListView: View {
    @EnvironmentObject private var coordinator: TrainListCoordinator.Router

    var body: some View {
        VStack {
            List(trains, id: \.name) { train in
                HStack {
                    Button(
                        action: {
                            coordinator.route(to: \.trainDetail, train)
                        },
                        label: { Text(train.name) }
                    )
                    Spacer()
                }
            }
            Spacer()
        }
        .navigationTitle(Text("Trains"))
    }
}

#Preview {
    TrainListView()
}
