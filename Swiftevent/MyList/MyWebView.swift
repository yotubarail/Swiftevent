//
//  MyWebView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct MyWebView: View {
    var eventData: Event
    
    var body: some View {
        UIWebView(url: eventData.url)
            .edgesIgnoringSafeArea(.bottom)
    }
}

//MARK: - Preview
struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        connpassWebView(eventData: mockEventsData[0])
    }
}
