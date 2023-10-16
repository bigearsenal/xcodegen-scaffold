import Common
import SwiftUI

struct DAppsWidgetView: View {
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
            }
            Grid {
                GridRow(alignment: .center) {
                    AccountWidget()
                    AssetsWidget()
                }
                GridRow {
                    WaitingTransactionsWidget()
                }
                .gridCellColumns(2)

                GridRow {
                    BinanceWidget()
                }
                .gridCellColumns(2)

                GridRow {
                    EthereumWidget()

                    SolanaWidget()
                }

                GridRow {
                    BitcoinWidget()
                }
                .gridCellColumns(2)
            }
            .background(
                GeometryReader { geo in
                    Image("wallpaper-2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: 2000)
                        .offset(y: -500)
                }.ignoresSafeArea()
            )
            .padding()
        }
        .navigationTitle("Home")
    }
}

#Preview {
    NavigationStack {
        DAppsWidgetView()
    }
}
