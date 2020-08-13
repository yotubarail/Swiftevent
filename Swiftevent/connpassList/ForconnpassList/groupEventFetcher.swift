//
//  groupEventFetcher.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import Foundation

class GroupEventFetcher: ObservableObject {
    
    @Published var eventData: [Event] = []

    init() {
        fetchEventData()
    }

    func fetchEventData() {
        guard let url = URL(string: "https://connpass.com/api/v1/event/?keyword=swift&order=2&count=25") else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let searchedResultData = try decoder.decode(group.self, from: data)
                DispatchQueue.main.async {
                    self.eventData = searchedResultData.events.reversed()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
