//
//  ViewController.swift
//  ShoppingUSA
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var dolarTextField: UITextField!
    @IBOutlet weak var realDescriptionLabel: UILabel!
    @IBOutlet weak var realLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setAmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dolarTextField.resignFirstResponder()
        setAmount()
    }
    
    func setAmount() {
        tc.shoppingValue = tc.convertToDouble(dolarTextField.text!)
        realLabel.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "U$ ")
        realDescriptionLabel.text = "Valor sem impostos (dolar \(dolar))"
    }
}

extension ShoppingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // faz o teclado desaparecer
        setAmount()
        return true
    }
}
