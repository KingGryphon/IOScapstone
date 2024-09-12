//
//  MenuItem.swift
//  IOScapstone
//
//  Created by Archer Bergmann on 9/12/24.
//

import SwiftUI
import Foundation

struct MenuItem: Identifiable, Decodable {
    let id: Int
    let title: String
    let image: String
    let price: String
    let description: String
    let category: String?
}


