//
//  InterfaceController.swift
//  CurrencyConvertor WatchKit Extension
//
//  Created by Mike Sedaghatnia on 2021-02-19.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var amountLabel: WKInterfaceLabel!
    @IBOutlet weak var amountSlider: WKInterfaceSlider!
    @IBOutlet weak var currencyPicker: WKInterfacePicker!
    
    static let currencies = ["AUD", "CAD", "CHF", "CNY", "EUR", "GBP", "HKD", "JPY", "SGD", "USD"]
    static let defaultCurrencies = ["USD", "EUR"]
    static let selectedCurrencyKey = "SelectedCurrencies"
    var currentCurrency = "AUD"
    var currentAmount = 500
    
    var items = [WKPickerItem]()
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        
        for currency in InterfaceController.currencies {
            let item = WKPickerItem()
            item.title = currency
            items.append(item)
        }
        
        currencyPicker.setItems(items)
        amountSlider.setNumberOfSteps(50)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

    @IBAction func amountChanged(_ value: Float) {
        currentAmount = Int(value)
        amountLabel.setText("\(currentAmount)")
    }
    
    @IBAction func baseCurrencyChanged(_ value: Int) {
        currentCurrency = InterfaceController.currencies[value]
    }
    
    @IBAction func convertTapped() {
        
        let context = ["amount" : String(currentAmount), "base" : currentCurrency]
        WKInterfaceController.reloadRootPageControllers(withNames: ["Results"], contexts: [context], orientation: .vertical, pageIndex: 0)
        
    }
}
