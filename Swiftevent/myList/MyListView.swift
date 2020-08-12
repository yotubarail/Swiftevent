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
    @State var showActionSheet = false
    @State private var activeSheet: ActiveSheet = .first
    @State var setting = false
        
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
                        ActionSheet(title: Text("メニュー"),
                            message: Text("選択してください"),
                            buttons: [
                                .default(Text("詳細を見る"), action: {
                                    self.showModal = true
                                    self.activeSheet = .first
                                }),
                                .default(Text("地図を開く"), action: {
                                    self.showModal = true
                                    self.activeSheet = .second
                                }),
                                .cancel()
                            ]
                        )
                    }
                )
                .sheet(isPresented: self.$showModal) {
                    if self.activeSheet == .first {
                        MyWebView(eventData: event)
                    }
                    else {
                        MyMapView(eventData: event)
                    }
                }
               }
            .listRowInsets(EdgeInsets())
            }
        .navigationBarTitle("参加イベント")
            .navigationBarItems(trailing:
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
    .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://connpass.com/api/v1/event/?nickname=\(UserDefaults.standard.string(forKey: "userName") ?? "")&order=2") else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let searchedResultData = try decoder.decode(myGroup.self, from: data)
                DispatchQueue.main.async {
                    self.fetcher.eventData = searchedResultData.events.reversed()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
