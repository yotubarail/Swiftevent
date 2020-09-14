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
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 22.0))
                        .frame(minWidth: 44.0, maxWidth: .infinity,
                    minHeight: 44.0, alignment: .center)
                    Text("検索結果")
                }
            }.tag(1)
            
            MyListView().tabItem {
                VStack {
                    Image(systemName: "person.circle.fill")
                    .font(.system(size: 22.0))
                    Text("参加イベント")
                }
            }.tag(2)
        }
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
