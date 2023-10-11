import SwiftUI

struct PinCodeView: View {
    @StateObject private var viewModel: PinCodeViewModel

    public init() {
        _viewModel = .init(wrappedValue: .init())
    }

    public var body: some View {
        VStack {
            Button(action: {
                viewModel.validatePinCode()
            }, label: {
                Text("Enter PinCode")
            })
        }
    }
}

#Preview {
    PinCodeView()
}
