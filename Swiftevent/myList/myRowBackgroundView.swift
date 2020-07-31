//
//  myRowBackgroundView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/30.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct myRowBackgroundView: View {
    var body: some View {
        ZStack {
            Color.costomColor
        }
    }
}

extension Color {
    static let costomColor = Color("myRow")
}

struct rowBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        myRowBackgroundView()
    }
}
