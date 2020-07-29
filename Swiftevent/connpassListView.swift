//
//  connpassListView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct connpassListView: View {
    
    @State var showModal = false
    
//    let events: [Event] = mockEventsData
     @ObservedObject var fetcher = groupEventFetcher()
    
    var body: some View {
        NavigationView {
            List(fetcher.eventData) { event in
            //            NavigationLink(destination: connpassWebView(eventData: event)){
            //                connpassRowView(eventData: event)
            //            }
                Button(action: {
                    self.showModal.toggle()
                }) {
                    connpassRowView(eventData: event)
                }
                .sheet(isPresented: self.$showModal) {
                        connpassWebView(eventData: event)
                }
            }
        .navigationBarTitle("connpass検索結果")
        }
    }
}

struct connpassListView_Previews: PreviewProvider {
    static var previews: some View {
        connpassListView()
    }
}
