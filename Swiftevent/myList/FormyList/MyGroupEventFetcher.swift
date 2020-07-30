//
//  MyGroupEventFetcher.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import Foundation

class myGroupEventFetcher: ObservableObject {

    @Published private var urlLink = "https://connpass.com/api/v1/event/?nickname=\(UserDefaults.standard.string(forKey: "userName") ?? "")&order=2"
    
    @Published var eventData: [myEvent] = []

    init() {
        fetchEventData()
    }

    func fetchEventData() {
        URLSession.shared.dataTask(with: URL(string: urlLink)!) { data, response, error in
            guard let data = data else {
                return
            }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let searchedResultData = try decoder.decode(myGroup.self, from: data)
                DispatchQueue.main.async {
                    self.eventData = searchedResultData.events.reversed()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
