import Common
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Button(action: {
                loggedInSubject.send(false)
            }, label: {
                Text("Log out")
            })
        }
        .navigationBarItems(
            trailing: Button(
                action: {},
                label: { Image(systemName: "xmark") }
            )
        )
        .navigationTitle(Text("Capacity"))
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
