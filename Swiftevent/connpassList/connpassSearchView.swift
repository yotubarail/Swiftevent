//
//  connpassSearchView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/08/13.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct connpassSearchView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var addSearch = UserDefaults.standard.string(forKey: "search") ?? ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
                VStack{
                    Spacer()
                    TextField("キーワードを入力", text: $addSearch)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250)
                    Text("※半角英数字のみ対応")
                        .font(.system(size: 15))
                        .padding(.bottom, 50)
                    Button(action: inUserDefaults, label: {
                        Text("検索")
                            .foregroundColor(Color.white)
                            .frame(width: 150, height: 50)
                            .background(Color.blue)
                            .padding(.vertical, 25)
                    })
                    Spacer()
                }
            }
        .navigationBarTitle("検索",displayMode: .inline)
        .navigationBarItems(leading: Button("完了") {
            self.presentationMode.wrappedValue.dismiss()
        },
        trailing: Button("クリア") {
            UserDefaults.standard.removeObject(forKey: "search")
            self.addSearch = ""
        })
        .font(.system(size: 22))
        }
    }
    func inUserDefaults() {
        UserDefaults.standard.set(addSearch, forKey: "search")
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct connpassSearchView_Previews: PreviewProvider {
    static var previews: some View {
        connpassSearchView()
    }
}
