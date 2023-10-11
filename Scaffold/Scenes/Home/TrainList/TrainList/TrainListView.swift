import Common
import ComposableNavigator
import Foundation
import SwiftUI

struct TrainListView: View {
    @Environment(\.navigator) private var navigator: Navigator
    @Environment(\.currentScreen) private var currentScreen

    var body: some View {
        VStack {
            List(trains, id: \.name) { train in
                HStack {
                    Button(
                        action: {
                            navigator.go(
                                to: TrainDetailScreen(id: train.id, train: train),
                                on: currentScreen
                            )
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
