//
//  ViewController.swift
//  Tipsy
//
//  Created by Samed Karakuş on 4.08.2024.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var thirtyPercentBtn: UIButton!
    @IBOutlet weak var twentyPercentBtn: UIButton!
    @IBOutlet weak var tenPercentBtn: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var billAmountArea: UIView!
    
    var tipCalculator = TipCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.keyboardType = .numberPad
        
        billAmountArea.layer.cornerRadius = 10
        billAmountArea.layer.masksToBounds = false
        billAmountArea.layer.shadowColor = UIColor.black.cgColor
        billAmountArea.layer.shadowOpacity = 0.1
        billAmountArea.layer.shadowOffset = CGSize(width: 2, height: 2)
        billAmountArea.layer.shadowRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalBill = tipCalculator.getTotalBill()
            destinationVC.settings = tipCalculator.getSettings()
        }
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        tenPercentBtn.isSelected = false
        twentyPercentBtn.isSelected = false
        thirtyPercentBtn.isSelected = false
        sender.isSelected = true
        
        
        let tipPercentage = tipCalculator.calculatePercentageAmount(sender.titleLabel?.text)
        let totalBill = Double(billTextField.text!) ?? 0.0
        let split = Int(splitNumberLabel.text!) ?? 2
        
        tipCalculator.bill = Bill(tip: tipPercentage, totalBill: totalBill, split: split)
    }

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal = Double(billTextField.text!)!
        let splitTotal = Int(splitNumberLabel.text!)!
        
        if var bill = tipCalculator.bill {
            bill.totalBill = tipCalculator.calculateResultAmount(billTotal, bill.tip, splitTotal)
            tipCalculator.bill = bill
        }
        performSegue(withIdentifier: "goToResult", sender: self)
    }
}

