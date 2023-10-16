import Common
import Foundation
import Stinsen
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var router: SettingsCoordinator.Router

    var body: some View {
        List {
            HStack {
                Button(
                    action: {
                        router.route(to: \.profile)
                    },
                    label: { Text("Profile") }
                )
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
