//
//  MyMenuView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct MyMenuView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var addUserName = UserDefaults.standard.string(forKey: "userName") ?? ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
                VStack{
                    Spacer()
                    TextField("ユーザー名を入力", text: $addUserName)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250)
                        .padding(50)
                    Button(action: inUserDefaults, label: {
                        Text("ログイン")
                            .foregroundColor(Color.white)
                            .frame(width: 150, height: 50)
                            .background(Color.blue)
                            .padding(.vertical, 25)
                    })
                    Button(action: removeUserDefaults, label:  {
                        Text("ログアウト")
                            .foregroundColor(Color.white)
                            .frame(width: 150, height: 50)
                            .background(Color.red)
                            .padding(.vertical, 25)
                    })
                    Spacer()
                }
            }
        .navigationBarTitle("アカウント設定",displayMode: .inline)
        .navigationBarItems(leading: Button("完了") {
            self.presentationMode.wrappedValue.dismiss()
        })
        .font(.system(size: 22))
        }
    }
    
    func inUserDefaults() {
        UserDefaults.standard.set(addUserName, forKey: "userName")
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func removeUserDefaults() {
        UserDefaults.standard.removeObject(forKey: "userName")
        addUserName = ""
    }
}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


//MARK: - Preview
struct MyMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MyMenuView()
    }
}
