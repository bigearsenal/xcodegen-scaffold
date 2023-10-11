import Common
import ComposableNavigator
import SwiftUI

struct TrainDetailScreen: Screen {
    let id: Int?
    let train: Train?
    var presentationStyle: ScreenPresentationStyle = .push

    struct Builder: NavigationTree {
        var builder: some PathBuilder {
            Screen(
                content: { (screen: TrainDetailScreen) in
                    if let train = screen.train {
                        TrainDetailView(train: train)
                    } else if let id = screen.id {
                        TrainDetailView(id: id)
                    } else {
                        EmptyView()
                    }
                },
                nesting: {
                    TrainCapacityScreen.Builder()
                }
            )
        }
    }
}
