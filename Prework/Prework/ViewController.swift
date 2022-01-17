//
//  ViewController.swift
//  Prework
//
//  Created by Nathan Sanks on 1/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var tipSplitLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        billAmountTextField.becomeFirstResponder()
        
    }

    
    @IBAction func changePartySize(_ sender: UIStepper) {
        
        partySizeLabel.text = String(sender.value)
    }
    
    
    @IBAction func calulateTip(_ sender: Any) {
        
        //get bill amount from text field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get party size
        let partySize = Double(partySizeLabel.text!) ?? 1
        
        //get total tip (total * tip)
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        //get tip split
        let tipSplit = tip / partySize
        
        //update tip amount
        tipAmountLabel.text = String(format: "$%.2f" , tip)
        
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
        
        //update tip split
        tipSplitLabel.text = String(format: "$%.2f", tipSplit)
        
    }
    
}

