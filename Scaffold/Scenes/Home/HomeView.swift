//
//  NewContentView.swift
//  dWidget
//
//  Created by Giang Long Tran on 12.10.2023.
//

import SwiftUI

class BundleFacade {
    static var module: Bundle { Bundle(for: Self.self) }
}

struct HomeView: View {
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
            }
            Grid {
                GridRow(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Welcome @darklong")
                            .font(.headline)
                        Text("0xc0ffee25472...7E10F9d54979")
                            .font(.caption)
                        Spacer()
                    }
                    .card(title: "Account")

                    VStack(alignment: .leading) {
                        Text("Assets")
                            .font(.headline)
                        Text("500 USDC")
                        Text("35 SOL")
                    }
                    .small()
                    .card(title: "Assets")
                }
                GridRow {
                    VStack(alignment: .leading) {
                        Text("Waiting transactions (1)")
                            .font(.headline)
                        Text("Transfer (2/3 Confirms)")
                        Text("Transfer (2/3 Confirms)")
                    }
                    .small()
                    .card(title: "Transactions")
                }
                .gridCellColumns(2)

                GridRow {
                    WebWidgetContent(url: BundleFacade.module
                        .url(forResource: "binance-widget", withExtension: "html")!)
                        .allowsHitTesting(false)
                        .frame(height: 50)
                        .cardWithoutPadding(title: "Binance")
                }
                .gridCellColumns(2)

//                GridRow {
//                    WebWidgetContent(url: Bundle.main.url(forResource: "eth-diagram", withExtension: "html")!)
//                        .allowsHitTesting(false)
//                        .frame(height: 200)
//                        .cardWithoutPadding(title: "Cryptohopper")
//
//                    WebWidgetContent(url: Bundle.main.url(forResource: "sol-diagram", withExtension: "html")!)
//                        .allowsHitTesting(false)
//                        .frame(height: 200)
//                        .cardWithoutPadding(title: "Cryptohopper")
//                }
//
//                GridRow {
//                    WebWidgetContent(url: Bundle.main.url(forResource: "btc-diagram", withExtension: "html")!)
//                        // .allowsHitTesting(false)
//                            .medium()
//                            .cardWithoutPadding(title: "Cryptohopper")
//                }
//                .gridCellColumns(2)
            }
            .padding(.horizontal, 8)
            .background(
                GeometryReader { geo in
                    Image("wallpaper-2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: 2000)
                        .offset(y: -500)
                }.ignoresSafeArea()
            )
        }
    }
}

#Preview {
    HomeView()
}
