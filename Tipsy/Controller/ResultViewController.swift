//
//  ResultController.swift
//  Tipsy
//
//  Created by Samed Karakuş on 4.08.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    var totalBill: String?
    var settings: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalBill
        settingsLabel.text = settings
    }
    
    @IBAction func OkPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
