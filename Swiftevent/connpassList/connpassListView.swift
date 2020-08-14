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
    @State var search = false
    
//    let events: [Event] = mockEventsData
     @ObservedObject var fetcher = GroupEventFetcher()
    
    var body: some View {
        NavigationView {
            List {
               ForEach(fetcher.eventData.sorted { $0.date > $1.date})  { event in
                    Button(action: {
                            self.showModal.toggle()
                    }) {
                            connpassRowView(eventData: event)
                        }
                        .sheet(isPresented: self.$showModal) {
                                connpassWebView(eventData: event)
                        }
                    }
                .listRowInsets(EdgeInsets())
            }
        .navigationBarTitle("connpass検索結果")
        .navigationBarItems(leading:
        Button(action: {
            self.fetcher.fetchEventData()
        }) {
            Image(systemName: "goforward")
                .font(.system(size: 22))
                .frame(width: 44)
        },trailing:
        Button(action: {
            self.search.toggle()
        }) {
            Text("検索")
                .font(.system(size: 22))
        }
        .sheet(isPresented: self.$search,
               onDismiss: self.fetcher.fetchEventData) {
                connpassSearchView()
        })
        }
        .onAppear() {
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct connpassListView_Previews: PreviewProvider {
    static var previews: some View {
        connpassListView()
    }
}
