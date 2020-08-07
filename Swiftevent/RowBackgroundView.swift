//
//  RowBackgroundView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/31.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct connpassRowBackgroundView: View {
    var body: some View {
        Color.connpassColor
    }
}

struct connpassListBackgroundView: View {
    var body: some View {
        Color.connpassListColor
    }
}

struct myRowBackgroundView: View {
    var body: some View {
        Color.myRowColor
    }
}

struct myListBackgroundView: View {
    var body: some View {
        Color.myListColor
    }
}

extension Color {
    static let connpassColor = Color("connpassRow")
    static let connpassListColor = Color("connpassList")
    static let myRowColor = Color("myRow")
    static let myListColor = Color("myList")
}


struct connpassRowBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        connpassRowBackgroundView()
    }
}
