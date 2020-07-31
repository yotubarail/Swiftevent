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
    @State var setting = false
        
    @ObservedObject var fetcher = MyGroupEventFetcher()
        
    var body: some View {
        NavigationView {
            List {
               ForEach(fetcher.eventData.sorted { $0.date > $1.date})  { event in
                    Button(action: {
                            self.showModal.toggle()
                    }) {
                            MyRowView(eventData: event)
                        }
                        .sheet(isPresented: self.$showModal) {
                                MyWebView(eventData: event)
                        }
                    }
                .listRowInsets(EdgeInsets())
            }
        .navigationBarTitle("参加イベント")
            .navigationBarItems(trailing:
//                   NavigationLink(destination: MyMenuView(), label: {
//                   Text("設定")
//                       .font(.system(size: 20))
//               })
                Button(action: {
                    self.setting.toggle()
                }) {
                    Text("設定")
                        .font(.system(size: 22))
                }
                .sheet(isPresented: self.$setting) {
                        MyMenuView()
                }
            )
        }
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
