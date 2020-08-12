//
//  MyGroupEventFetcher.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import Foundation

class MyGroupEventFetcher: ObservableObject {

    private var url = "https://connpass.com/api/v1/event/?nickname=\(UserDefaults.standard.string(forKey: "userName") ?? "")&order=2"
    
    @Published var eventData: [myEvent] = []

    init() {
        fetchMyEventData()
    }

    func fetchMyEventData() {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data else {
                return
            }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let searchedMyData = try decoder.decode(myGroup.self, from: data)
                DispatchQueue.main.async {
                    self.eventData = searchedMyData.events.reversed()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
