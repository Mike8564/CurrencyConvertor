//
//  CurrenciesInterfaceController.swift
//  CurrencyConvertor WatchKit Extension
//
//  Created by Mike Sedaghatnia on 2021-02-19.
//

import WatchKit
import Foundation


class CurrenciesInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var currencyTable: WKInterfaceTable!
    
    let selectedColor = #colorLiteral(red: 1, green: 0.4920719862, blue: 0.5697046518, alpha: 1)
    let deselectedColor = #colorLiteral(red: 0.266071558, green: 0.3796185255, blue: 0.4712331891, alpha: 1)
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        currencyTable.setNumberOfRows(InterfaceController.currencies.count, withRowType: "Row")
        
        let defaults = UserDefaults.standard
        let selectedCurrency = defaults.array(forKey: InterfaceController.selectedCurrencyKey) as? [String] ?? InterfaceController.defaultCurrencies
        
        for (index, currency) in InterfaceController.currencies.enumerated() {
            
            guard let row = currencyTable.rowController(at: index) as? CurrencyRow else {continue}
            
            row.currencyLabel.setText(currency)
            
            if selectedCurrency.contains(currency) {
                row.group.setBackgroundColor(selectedColor)
            } else {
                row.group.setBackgroundColor(deselectedColor)
            }
            
        }
    }

    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        
        // grab the row and typeCast it
        guard let row = table.rowController(at: rowIndex) as? CurrencyRow else {return}
        
        // pullout the current list of selected currencies, or use the default one
        let defaults = UserDefaults.standard
        var selectedCurrencies = defaults.array(forKey: InterfaceController.selectedCurrencyKey) as? [String] ?? InterfaceController.defaultCurrencies
        
        // find name the currency tapped
        let selectedCurrency = InterfaceController.currencies[rowIndex]
        
        // if the currency is found in our selectedCurrencies, remove it
        if let index = selectedCurrencies.firstIndex(of: selectedCurrency) {
            selectedCurrencies.remove(at: index)
            row.group.setBackgroundColor(deselectedColor)
        } else {
            selectedCurrencies.append(selectedCurrency)
            row.group.setBackgroundColor(selectedColor)
        }
        
        defaults.set(selectedCurrencies, forKey: InterfaceController.selectedCurrencyKey)
    }
    
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
