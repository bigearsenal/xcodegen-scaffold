import Onboarding
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.flower2)
                .resizable()
                .frame(width: 40, height: 40)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            OnboardingView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
