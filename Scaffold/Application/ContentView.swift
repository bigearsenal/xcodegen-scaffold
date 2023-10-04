import Onboarding
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.flower)
                .resizable()
                .frame(width: 40, height: 40)
            Text("Hello, world!")
            OnboardingView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
