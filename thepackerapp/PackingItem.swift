//
//  PackingItem.swift
//  thepackerapp
//
//  Created by Matt Dyor on 6/20/24.
//

import SwiftUI

import Foundation

struct PackingItem: Identifiable, Decodable {
    var id: Int
    var name: String
    var quantity: Int
    var isPacked: Bool = false
}
