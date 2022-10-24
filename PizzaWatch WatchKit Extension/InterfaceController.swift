//
//  InterfaceController.swift
//  PizzaWatch WatchKit Extension
//
//  Created by Mitya Kim on 10/23/22.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    // MARK: - Properties
    let menu = MenuModel.menu

    // MARK: - Outlets
    @IBOutlet weak var table: WKInterfaceTable!
    @IBOutlet weak var selectedItemLabel: WKInterfaceLabel!
    @IBOutlet weak var clearButton: WKInterfaceButton!
    
    // MARK: - Actions
    @IBAction func doClearSelection() {
        selectedItemLabel.setText("Menu")
        SelectedItem.current.selected = nil
    }
    
    // MARK: - Helper Methods
    func loadTable() {
        table.setNumberOfRows(menu.count, withRowType: "row")
        
        for index in 0..<menu.count {
            let row = self.table.rowController(at: index) as! RowController
            row.label.setText(menu[index].name)
            row.image.setImageNamed("\(menu[index].id)_100w")
        }
    }
    
    // MARK: - Lifecycle
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        loadTable()
        selectedItemLabel.setText("Awake")
        clearButton.setBackgroundColor(.red)
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
//        pushController(withName: "DetailController", context: menu[rowIndex])
//        presentController(withName: "DetailController", context: menu[rowIndex])
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        selectedItemLabel.setText(SelectedItem.current.selected?.name ?? "Menu")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return menu[rowIndex]
    }

}

class RowController: NSObject {
    @IBOutlet weak var image: WKInterfaceImage!
    @IBOutlet weak var label: WKInterfaceLabel!
}
