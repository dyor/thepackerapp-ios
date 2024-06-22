//
//  NetworkTestView.swift
//  thepackerapp
//
//  Created by Matt Dyor on 6/21/24.
//

import Foundation
import SwiftUI

struct TestNetworkView: View {
    @State private var result = ""

    var body: some View {
        VStack {
            Text(result).padding()
            Button("Test Network") {
                testNetwork()
            }
        }
    }

    func testNetwork() {
        guard let url = URL(string: "https://dyor.github.io/thepackerapp/default_packing_list.json") else {
            self.result = "Invalid URL"
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.result = "Network request failed: \(error.localizedDescription)"
                }
            } else if let data = data {
                DispatchQueue.main.async {
                    self.result = "Received data: \(data.count) bytes"
                }
            }
        }.resume()
    }
}

struct TestNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        TestNetworkView()
    }
}
