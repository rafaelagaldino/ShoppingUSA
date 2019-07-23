//
//  TaxesViewController.swift
//  ShoppingUSA
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var dolarLabel: UILabel!
    @IBOutlet weak var stateTaxDescriptionLabel: UILabel!
    @IBOutlet weak var stateTaxTLabel: UILabel!
    @IBOutlet weak var iofDescriptionLabel: UILabel!
    @IBOutlet weak var iofLabel: UILabel!
    @IBOutlet weak var CreditCardSwitch: UISwitch!
    @IBOutlet weak var realLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        calculateTaxes()
    }
    
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        stateTaxDescriptionLabel.text = "Imposto do estado (\(tc.getFormattedValue(of: tc.stateTax, withCurrency: ""))%)"
        iofDescriptionLabel.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: ""))%)"
        dolarLabel.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$ ")
        stateTaxTLabel.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "US$ ")
        iofLabel.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$ ")
        
        let real = tc.calculate(usingCreditCard: CreditCardSwitch.isOn)
        realLabel.text = tc.getFormattedValue(of: real, withCurrency: "R$ ")
    }
}
