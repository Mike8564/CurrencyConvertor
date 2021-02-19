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
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

    @IBAction func amountChanged(_ value: Float) {
    }
    
    @IBAction func baseCurrencyChanged(_ value: Int) {
    }
    
    @IBAction func convertTapped() {
    }
}
