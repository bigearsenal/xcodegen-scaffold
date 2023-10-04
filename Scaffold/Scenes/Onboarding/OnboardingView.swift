import Common
import SwiftUI

public struct OnboardingView: View {
    public init() {}

    public var body: some View {
        VStack {
            Image(.flower)
                .resizable()
                .frame(width: 40, height: 40)
            Text("Hello, World!")
        }
        .onAppear {
            TestService().sayHello()
        }
    }
}

#Preview {
    OnboardingView()
}
