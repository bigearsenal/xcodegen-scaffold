import SwiftUI

public struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel

    public init() {
        _viewModel = .init(wrappedValue: .init())
    }

    public var body: some View {
        TabView {
            Text("List")
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            Button(action: {
                Task {
                    await viewModel.logout()
                }
            }, label: {
                Text("Logout")
            })
            .tabItem {
                Label("Order", systemImage: "square.and.pencil")
            }
        }
    }
}

#Preview {
    HomeView()
}
