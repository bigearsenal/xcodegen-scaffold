import SwiftUI

struct PinCodeView: View {
    @StateObject private var viewModel: PinCodeViewModel

    public init() {
        _viewModel = .init(wrappedValue: .init())
    }

    public var body: some View {
        VStack {
            HStack {
                Image(systemName: "circle.fill")
                Image(systemName: "circle.fill")
                Image(systemName: "circle")
                Image(systemName: "circle")
                Image(systemName: "circle")
                Image(systemName: "circle")
            }

            Button(action: {
                viewModel.validatePinCode()
            }, label: {
                Text("Enter PinCode")
            })
            .padding(.top, 20)
        }
    }
}

#Preview {
    PinCodeView()
}
