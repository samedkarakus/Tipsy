//
//  Bill.swift
//  Tipsy
//
//  Created by Samed Karakuş on 5.08.2024.
//

import Foundation

struct Bill {
    var tip: Double
    var totalBill: Double
    var split: Int
    
    init(tip: Double, totalBill: Double, split: Int) {
        self.tip = tip
        self.totalBill = totalBill
        self.split = split
    }
}
