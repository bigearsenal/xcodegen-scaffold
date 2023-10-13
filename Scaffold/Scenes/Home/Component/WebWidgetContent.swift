//
//  WebWidget.swift
//  dWidget
//
//  Created by Giang Long Tran on 15.09.2023.
//

import SwiftUI
import WebKit

struct WebWidgetContent: UIViewRepresentable {
    let url: URL

    func makeUIView(context _: Context) -> WKWebView {
        let userContentController = WKUserContentController()
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController

        let preferences = WKPreferences()
        if #available(iOS 14.5, *) {
            preferences.isTextInteractionEnabled = false
        }
        configuration.preferences = preferences

        let webView = WKWebView(frame: .zero, configuration: configuration)

        webView.load(URLRequest(url: url))
        webView.isOpaque = false
        webView.backgroundColor = UIColor.clear
        webView.scrollView.backgroundColor = UIColor.clear
        webView.scrollView.isScrollEnabled = false
        
        webView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        webView.scrollView.contentInsetAdjustmentBehavior = .never;

        // webView.setValue(true, forKey: "drawsTransparentBackground")

        return webView
    }

    func updateUIView(_: WKWebView, context _: Context) {
        // This space can be left blank
    }
}

struct WebWidget_Previews: PreviewProvider {
    static var previews: some View {
        WebWidgetContent(url: URL(string: "https://defillama-stable-coins.gbytebrain.com")!)
    }
}
