import ComposableNavigator
import SwiftUI

struct TrainCapacityScreen: Screen {
    let capacity: Int?
    let trainId: Int?
    var presentationStyle: ScreenPresentationStyle = .sheet(
        allowsPush: false,
        presentationDetent: [.fraction(2.0 / 3)]
    )

    struct Builder: NavigationTree {
        var builder: some PathBuilder {
            Screen { (screen: TrainCapacityScreen) in
                if let capacity = screen.capacity {
                    TrainCapacityView(capacity: capacity)
                } else if let trainId = screen.trainId {
                    TrainCapacityView(trainId: trainId)
                } else {
                    EmptyView()
                }
            }
        }
    }
}
