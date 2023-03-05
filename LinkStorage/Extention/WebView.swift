//
//  WebView.swift
//  LinkStorage
//
//  Created by Viktoriia Sharukhina on 05.03.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    @Binding var openUrl: String
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        
        if let url = URL(string: openUrl) {
            let openUrl = URLComponents(url: url, resolvingAgainstBaseURL: true)
            let request = URLRequest(url: openUrl?.url ?? url)
            webView.load(request)
        }
            
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
}
