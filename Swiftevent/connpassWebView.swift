//
//  connpassWebView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI
import SafariServices

struct connpassWebView: View {
    
    var eventData: Event
    
    var body: some View {
        SafariView(url: URL(string: eventData.url)!)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController

    var url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}

struct connpassWebView_Previews: PreviewProvider {
    static var previews: some View {
        connpassWebView(eventData: mockEventsData[0])
    }
}
