//
//  connpassWebView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI
import SafariServices
import WebKit

struct connpassWebView: View {
    
    var eventData: Event
    
    var body: some View {
        UIWebView(url: eventData.url)
            .edgesIgnoringSafeArea(.all)
    }
}

//struct SafariView: UIViewControllerRepresentable {
//    typealias UIViewControllerType = SFSafariViewController
//
//    var url: URL
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
//        return SFSafariViewController(url: url)
//    }
//
//    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
//    }
//}
struct UIWebView: UIViewRepresentable {
    var url:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}


//MARK: - Preview
struct connpassWebView_Previews: PreviewProvider {
    static var previews: some View {
        connpassWebView(eventData: mockEventsData[0])
    }
}
