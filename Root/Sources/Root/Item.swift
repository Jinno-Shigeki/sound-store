//
//  Item.swift
//  sound-store
//
//  Created by 神野成紀 on 2024/12/12.
//

import Foundation
import SwiftData

@Model
public final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
