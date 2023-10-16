import SwiftUI

extension View {
    func card(title: String = "Missing title") -> some View {
        VStack {
            self
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
                .padding(.all, 16)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))

            Text(title)
                .foregroundStyle(.thickMaterial)
                .colorInvert()
                .shadow(color: .black, radius: 50)
        }
    }

    func cardWithoutPadding(title: String = "Missing title") -> some View {
        VStack {
            self
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )

                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))

            Text(title)
                .foregroundStyle(.thickMaterial)
                .colorInvert()
                .shadow(color: .black, radius: 50)
        }
    }

    func medium() -> some View {
        frame(height: 200)
    }

    func small() -> some View {
        frame(height: 100)
    }
}
