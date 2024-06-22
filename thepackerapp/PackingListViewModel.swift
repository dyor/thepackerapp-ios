//
//  PackingListViewModel.swift
//  thepackerapp
//
//  Created by Matt Dyor on 6/20/24.
//

import Combine
import Foundation

class PackingListViewModel: ObservableObject {
    @Published var items: [PackingItem] = []

    func fetchItems() {
        guard let url = URL(string: "https://dyor.github.io/thepackerapp/default_packing_list.json?t=2") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let decodedResponse = try JSONDecoder().decode([PackingItem].self, from: data)
                    DispatchQueue.main.async {
                        self.items = decodedResponse
                    }
                } catch {
                    print("Decoding failed: \(error)")
                }
            } else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}

