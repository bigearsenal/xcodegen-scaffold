import Common
import Stinsen
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var router: SettingsCoordinator.Router

    var body: some View {
        VStack {
            Button(action: {
                loggedInSubject.send(false)
            }, label: {
                Text("Log out")
            })
        }
        .toolbar {
            Button(
                action: {
                    router.popLast()
                },
                label: {
                    Text("Cancel")
                }
            )
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("Profile"))
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
