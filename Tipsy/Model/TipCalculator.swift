//
//  TipCalculator.swift
//  Tipsy
//
//  Created by Samed Karakuş on 5.08.2024.
//

import Foundation

struct TipCalculator {
    
    var bill: Bill?
    
    func getTotalBill() -> String {
        return String(format: "$%.2f", bill?.totalBill ?? 0.0)
    }

    
    func getSettings() -> String {
        return "Split between \(bill!.split) people, with \(bill!.tip * 100)% tip"
    }
    
    func calculateResultAmount(_ billTotal: Double, _ tipAmount: Double, _ splitValue: Int) -> Double {
        let totalBillAmount = billTotal + (billTotal * tipAmount)
        let splittedAmount = totalBillAmount / Double(splitValue)
        return splittedAmount
    }
    
    func calculatePercentageAmount(_ percent: String?) -> Double {
        var percentageAmount = 0.0
        
        if percent == "10%" {
            percentageAmount =  0.1
        } else if percent == "20%" {
            percentageAmount = 0.2
        } else if percent == "30%" {
            percentageAmount = 0.3
        }
        return percentageAmount
    }
}
