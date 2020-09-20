//
//  MyWebView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI
import SafariServices
import WebKit

struct MyWebView: View {
    var eventData: myEvent
    
    var body: some View {
        UIMyWebView(url: eventData.url)
            .edgesIgnoringSafeArea(.bottom)
    }
}

//struct MySafariView: UIViewControllerRepresentable {
//    typealias UIViewControllerType = SFSafariViewController
//
//    var url: URL
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<MySafariView>) -> SFSafariViewController {
//        return SFSafariViewController(url: url)
//    }
//
//    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<MySafariView>) {
//    }
//}

struct UIMyWebView: UIViewRepresentable {
    var url:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}

//MARK: - Preview
struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(eventData: mockMyEventsData[0])
    }
}
