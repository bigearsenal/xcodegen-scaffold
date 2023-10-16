import Combine
import Foundation
import SwiftUI

final class MockWidgetsManager: WidgetsManager {
    var widgetsPublisher: AnyPublisher<[any Widget], Never> {
        Just([
            AccountWidget(),
        ])
        .eraseToAnyPublisher()
    }
}

struct AccountWidget: Widget {
    var type: WidgetType { .halfRow }

    var id: String {
        "Account"
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome @darklong")
                .font(.headline)
            Text("0xc0ffee25472...7E10F9d54979")
                .font(.caption)
            Spacer()
        }
        .card(title: "Account")
    }
}

struct AssetsWidget: Widget {
    var type: WidgetType { .halfRow }

    var id: String {
        "Assets"
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Assets")
                .font(.headline)
            Text("500 USDC")
            Text("35 SOL")
        }
        .small()
        .card(title: "Assets")
    }
}

struct WaitingTransactionsWidget: Widget {
    var type: WidgetType { .fullRow }

    var id: String {
        "WaitingTransactions"
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Waiting transactions (1)")
                .font(.headline)
            Text("Transfer (2/3 Confirms)")
            Text("Transfer (2/3 Confirms)")
        }
        .small()
        .card(title: "Transactions")
    }
}

struct BinanceWidget: Widget {
    var type: WidgetType { .fullRow }
    var id: String {
        "Binance"
    }

    var body: some View {
        WebWidgetContent(url: Bundle.module
            .url(forResource: "binance-widget", withExtension: "html")!)
            .allowsHitTesting(false)
            .frame(height: 50)
            .cardWithoutPadding(title: "Binance")
    }
}

struct EthereumWidget: Widget {
    var type: WidgetType { .halfRow }
    var id: String {
        "EthereumWidget"
    }

    var body: some View {
        WebWidgetContent(url: Bundle.module.url(forResource: "eth-diagram", withExtension: "html")!)
            .allowsHitTesting(false)
            .frame(height: 200)
            .cardWithoutPadding(title: "Cryptohopper")
    }
}

struct SolanaWidget: Widget {
    var type: WidgetType { .halfRow }
    var id: String {
        "SolanaWidget"
    }

    var body: some View {
        WebWidgetContent(url: Bundle.module.url(forResource: "sol-diagram", withExtension: "html")!)
            .allowsHitTesting(false)
            .frame(height: 200)
            .cardWithoutPadding(title: "Cryptohopper")
    }
}

struct BitcoinWidget: Widget {
    var type: WidgetType { .fullRow }
    var id: String {
        "BitcoinWidget"
    }

    var body: some View {
        WebWidgetContent(url: Bundle.module.url(forResource: "btc-diagram", withExtension: "html")!)
            // .allowsHitTesting(false)
            .medium()
            .cardWithoutPadding(title: "Cryptohopper")
    }
}

// MARK: - Private

private extension Bundle {
    static var module: Bundle {
        _Bundle.module
    }

    private class _Bundle {
        static var module: Bundle { Bundle(for: Self.self) }
    }
}
