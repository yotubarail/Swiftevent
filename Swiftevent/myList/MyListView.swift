//
//  MyListView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct MyListView: View {
    @State var showModal = false
        
    //    let events: [Event] = mockMyEventsData
         @ObservedObject var fetcher = myGroupEventFetcher()
        
        var body: some View {
            NavigationView {
                List(fetcher.eventData) { event in
                //            NavigationLink(destination: MyWebView(eventData: event)){
                //                connpassRowView(eventData: event)
                //            }
                    Button(action: {
                        self.showModal.toggle()
                    }) {
                        MyRowView(eventData: event)
                    }
                    .sheet(isPresented: self.$showModal) {
                            MyWebView(eventData: event)
                    }
                }
            .navigationBarTitle("参加イベント")
                .navigationBarItems(trailing: NavigationLink(destination: MyMenuView(), label: {
                    Text("設定")
                        .font(.system(size: 20))
                }))
            }
        }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
