//
//  MyWebView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI
import SafariServices

struct MyWebView: View {
    var eventData: myEvent
    
    var body: some View {
        SafariView(url: URL(string: eventData.url)!)
            .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle(eventData.title)
    }
}

struct MySafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController

    var url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<MySafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<MySafariView>) {
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(eventData: mockMyEventsData[0])
    }
}
