//
//  PackingItem.swift
//  thepackerapp
//
//  Created by Matt Dyor on 6/20/24.
//

import SwiftUI

import Foundation

struct PackingItem: Identifiable, Codable {
    var id: Int
    var name: String
    var quantity: Int
    var isPacked: Bool = false
}

struct Feed: Codable {
    let feed: [PackingItem]
}
