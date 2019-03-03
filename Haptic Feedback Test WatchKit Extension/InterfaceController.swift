//
//  InterfaceController.swift
//  Haptic Feedback Test WatchKit Extension
//
//  Created by Alexander Eichhorn on 03.03.19.
//  Copyright © 2019 Losjet - Alexander Eichhorn. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var tableView: WKInterfaceTable!
    
    let hapticFeedbacks: [WKHapticType] = [.notification, .directionUp, .directionDown, .success, .failure, .retry, .start, .stop, .click]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        tableView.setNumberOfRows(hapticFeedbacks.count, withRowType: "Cell")
        for (i, type) in hapticFeedbacks.enumerated() {
            let row = tableView.rowController(at: i) as? LabelRowController
            row?.label.setText(type.localizedDescription)
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        WKInterfaceDevice.current().play(hapticFeedbacks[rowIndex])
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

class LabelRowController: NSObject {
    @IBOutlet var label: WKInterfaceLabel!
}

extension WKHapticType {
    
    var localizedDescription: String {
        switch self {
        case .notification: return "Notification"
        case .directionUp: return "Direction Up"
        case .directionDown: return "Direction Down"
        case .success: return "Success"
        case .failure: return "Failure"
        case .retry: return "Retry"
        case .start: return "Start"
        case .stop: return "Stop"
        case .click: return "Click"
        }
    }
    
}
