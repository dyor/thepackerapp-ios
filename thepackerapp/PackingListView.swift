//
//  PackingListView.swift
//  thepackerapp
//
//  Created by Matt Dyor on 6/20/24.
//

import SwiftUI
import shared

struct PackingListView: View {
    @ObservedObject var viewModel = PackingListViewModel()

    var body: some View {
        VStack {
            List {
                ForEach($viewModel.items) { $item in
                    HStack {
                        Text("\(item.name) (\(item.quantity))")
                        Spacer()
                        Image(systemName: item.isPacked ? "checkmark.square" : "square")
                            .onTapGesture {
                                item.isPacked.toggle()
                            }
                    }
                }
            }
            .navigationTitle("Packing List")
            .onAppear {
                viewModel.fetchItems()
            }
            // Footer
//            Text("Total items: \(viewModel.items.count)")
//                .padding()
//                .font(.footnote)
//                .foregroundColor(.gray)
            Text(Greeting().greet())
                .padding()
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct PackingListView_Previews: PreviewProvider {
    static var previews: some View {
        PackingListView(viewModel: PackingListViewModel())
    }
}
