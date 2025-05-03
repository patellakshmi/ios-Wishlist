//
//  WishModel.swift
//  Wishlist
//
//  Created by RE on 03/05/25.
//

import Foundation
import SwiftData


@available(iOS 17, *)
@Model
class Wish{
    var title: String
    
    init(title: String) {
        self.title = title
    }
}











