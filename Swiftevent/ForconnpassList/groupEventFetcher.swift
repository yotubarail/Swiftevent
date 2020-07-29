//
//  groupEventFetcher.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import Foundation

class groupEventFetcher: ObservableObject {

    private let urlLink = "https://connpass.com/api/v1/event/?keyword=swift&order=2&count=25"
    
    @Published var eventData: [Event] = []

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
