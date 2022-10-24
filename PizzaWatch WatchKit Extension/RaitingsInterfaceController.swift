//
//  RaitingsInterfaceController.swift
//  PizzaWatch WatchKit Extension
//
//  Created by Mitya Kim on 10/23/22.
//

import WatchKit
import Foundation


class RaitingsInterfaceController: WKInterfaceController {

    @IBOutlet weak var itemRaitingsLabel: WKInterfaceLabel!
    @IBOutlet weak var itemDescription: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        if let item = context as? MenuItem {
            itemDescription.setText(item.description)
            itemRaitingsLabel.setText(String(repeating: "🍕", count: item.rating))
            setTitle(item.name)
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

}
