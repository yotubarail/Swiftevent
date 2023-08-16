//
//  UIWebView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/09/21.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI
import WebKit

struct UIWebView: UIViewRepresentable {
    var url:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}

