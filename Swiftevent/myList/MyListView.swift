//
//  MyListView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct MyListView: View {
    @State var showModal1 = false
    @State var showModal2 = false
    @State var setting = false
    @State var showActionSheet = false
        
    @ObservedObject var fetcher = MyGroupEventFetcher()
        
    var body: some View {
        NavigationView {
            List {
               ForEach(fetcher.eventData.sorted { $0.date > $1.date})  { event in
                    Button(action: {
                            self.showActionSheet.toggle()
                    }) {
                            MyRowView(eventData: event)
                        }
                .actionSheet(isPresented: self.$showActionSheet, content: {
                        ActionSheet(title: Text("Action"),
                            message: Text("Description"),
                            buttons: [
                                .default(Text("詳細"), action: {
                                    self.showModal1.toggle()
                                    print("タップs")
                                }),
                                .default(Text("地図"), action: {
                                    self.showModal2.toggle()
                                }),
                                .cancel()
                            ]
                        )
                    }
                )
                .sheet(isPresented: self.$showModal1) {
                    MyWebView(eventData: event)
                }
                .sheet(isPresented: self.$showModal2) {
                    MyMapView(eventData: event)
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
