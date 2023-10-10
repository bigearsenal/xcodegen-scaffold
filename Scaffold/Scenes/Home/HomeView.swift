import SwiftUI

public struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel

    public init() {
        _viewModel = .init(wrappedValue: .init())
    }

    public var body: some View {
        VStack {
            Image(.flower)
                .resizable()
                .frame(width: 200, height: 200)
            Text("Hello!")
            Button(action: {
                Task {
                    await viewModel.logout()
                }
            }, label: {
                Text("Log out")
            })
        }
    }
}

#Preview {
    HomeView()
}
