//
//  MyGroupEventFetcher.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import Foundation

class MyGroupEventFetcher: ObservableObject {
    
    @Published var eventData: [Event] = []
    let hudExtension = HudExtension()

    init() {
        fetchMyEventData()
    }

    func fetchMyEventData() {
        hudExtension.showProgress()
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
                let searchedMyData = try decoder.decode(group.self, from: data)
                DispatchQueue.main.async {
                    self.eventData = searchedMyData.events.reversed()
                    self.hudExtension.hideProgress()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
