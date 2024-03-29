//
//  MyListView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

enum ActiveSheet {
   case first, second
}

struct MyListView: View {
    @State var showModal = false
    @State var setting = false
        
    @ObservedObject var fetcher = MyGroupEventFetcher()
        
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(fetcher.eventData.sorted { $0.date > $1.date})  { event in
                 VStack {
                     NavigationLink(destination: MyWebView(eventData: event)) {
                         MyRowView(eventData: event)
                     }
                     NavigationLink(destination: MyMapView(eventData: event)) {
                         Text("地図を開く")
                            .font(.system(size: 22))
                     }
                    Spacer()
                 }
                }
            }
        .listStyle(PlainListStyle())
        .navigationBarTitle("参加イベント")
            .navigationBarItems(leading:
                Button(action: {
                    self.fetcher.fetchMyEventData()
                }) {
                    Image(systemName: "goforward")
                        .font(.system(size: 22))
                        .frame(width: 44)
                },trailing:
                Button(action: {
                    self.setting.toggle()
                }) {
                    Text("設定")
                        .font(.system(size: 22))
                }
                .sheet(isPresented: self.$setting,
                       onDismiss: self.fetcher.fetchMyEventData) {
                        MyMenuView()
                }
            )
        }
    }
}


//MARK: - Preview
struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
