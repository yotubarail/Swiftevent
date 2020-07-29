//
//  ContentView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            connpassListView().tabItem {
                VStack {
                    Image(systemName: "airplane")
                    Text("検索結果")
                }
            }.tag(1)
            
            MyListView().tabItem {
                VStack {
                    Image(systemName: "mappin")
                    Text("参加イベント")
                }
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
