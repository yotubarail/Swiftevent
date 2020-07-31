//
//  connpassRowBackgroundView.swift
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

extension Color {
    static let connpassColor = Color("connpassRow")
}


struct connpassRowBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        connpassRowBackgroundView()
    }
}
