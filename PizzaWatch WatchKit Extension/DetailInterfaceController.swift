//
//  DetailInterfaceController.swift
//  HuliPizzaWatchStoryboard WatchKit Extension
//
//  Created by Steven Lipton on 4/17/20.
//  Copyright © 2020 Steven Lipton. All rights reserved.
//

import WatchKit
import Foundation


class DetailInterfaceController: WKInterfaceController {
    
    // MARK: - Properties
    var item: MenuItem!
    
    // MARK: - Outlets
    @IBOutlet weak var itemName: WKInterfaceLabel!
    @IBOutlet weak var itemImage: WKInterfaceImage!
//    @IBOutlet weak var itemDescription: WKInterfaceLabel!
    @IBOutlet weak var selectButton: WKInterfaceButton!
    
    // MARK: - Actions
    @IBAction func doSelectButton() {
        SelectedItem.current.selected = item
//        pop()
        dismiss()
    }
   
    @IBAction func showRaitings() {
        pushController(withName: "RaitingsInterfaceController", context: item)
    }
    
    // MARK: - Lifecycle
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        
        if  let menuItem = context as? MenuItem {
//            itemDescription.setText(menuItem.description)
            itemName.setText(menuItem.name)
            itemImage.setImageNamed("\(menuItem.id)_100w")
            item = menuItem
            setTitle("Details")
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
