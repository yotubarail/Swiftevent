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
        let urlString: String = "https://connpass.com/api/v1/event/?keyword=\(UserDefaults.standard.string(forKey: "search") ?? "")&order=2&count=100"
        let encode = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: encode!) else {
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
