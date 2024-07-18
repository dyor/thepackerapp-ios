//
//  PackingListViewModel.swift
//  thepackerapp
//
//  Created by Matt Dyor on 6/20/24.
//

import Combine
import Foundation
import shared




class PackingListViewModel: ObservableObject {
    @Published var items: [PackingItem] = []
    func fetchItems() {
        
        guard let url = URL(string: "https://dyor.github.io/thepackerapp/default_packing_list.json?t=2") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in


                
//            itemDao.getAllItems().collect { itemList ->
//                            _items.value = itemList
//                            Log.d("PackingListViewModel4", itemList.firstOrNull().toString())
//                            Log.d("PackingListViewModel3", "Fetched ${itemList.size} items ")
//                        }
            //if (_items.value.isEmpty()) {
                if let data = data, error == nil {
                    do {
                        let decodedResponse = try JSONDecoder().decode(Feed.self, from: data)
                        DispatchQueue.main.async {
                            self.items = decodedResponse.feed
                        }
                    } catch {
                        print("Decoding failed: \(error)")
                    }
                } else {
                    print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                }
            //}
                }.resume()
    }
}

