//
//  SettingsViewController.swift
//  ShoppingUSA
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var dolarTextField: UITextField!
    @IBOutlet weak var iofTextField: UITextField!
    @IBOutlet weak var stateTaxesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dolarTextField.text = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        iofTextField.text = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        stateTaxesTextField.text = tc.getFormattedValue(of: tc.stateTax, withCurrency: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues() {
        tc.dolar = tc.convertToDouble(dolarTextField.text!)
        tc.iof = tc.convertToDouble(iofTextField.text!)
        tc.stateTax = tc.convertToDouble(stateTaxesTextField.text!)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
