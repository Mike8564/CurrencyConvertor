//
//  ResultInterfaceController.swift
//  CurrencyConvertor WatchKit Extension
//
//  Created by Mike Sedaghatnia on 2021-02-19.
//

import WatchKit
import Foundation


class ResultInterfaceController: WKInterfaceController {
    @IBOutlet weak var table: WKInterfaceTable!
    @IBOutlet weak var fetchingLabel: WKInterfaceLabel!
    @IBOutlet weak var doneButton: WKInterfaceButton!
    
    var fetchCurrencies = [(symbol:String, rate:Double)]()
    var amountToConvert = 0.0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        guard let settings = context as? [String : String] else {return}
        guard let amount = settings["amount"] else {return}
        guard let baseCurrency = settings["base"] else {return}
        
        amountToConvert = Double(amount) ?? 50.0
        let defaults = UserDefaults.standard
        let selectedCurrencies = defaults.array(forKey: InterfaceController.selectedCurrencyKey) as? [String] ?? InterfaceController.defaultCurrencies
        
        DispatchQueue.main.async {
            self.fetchData(for: baseCurrency, symbols: selectedCurrencies)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func doneTapped() {
        WKInterfaceController.reloadRootPageControllers(withNames: ["Home", "Currencies"], contexts: nil, orientation: .horizontal, pageIndex: 0)
    }
    
    func fetchData(for baseCurrency: String, symbols: [String]) {
        
    }
    
    func parse(content: Data) {
        
    }
    
    func updateTable() {
        
    }
}
