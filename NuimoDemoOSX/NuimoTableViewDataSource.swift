//
//  NuimoDataSource.swift
//  NuimoDemoOSX
//
//  Created by Lars Blumberg on 10/19/15.
//  Copyright © 2015 senic. All rights reserved.
//

import Cocoa
import NuimoSwift

class NuimoTableViewDataSource : NSObject, NSTableViewDataSource {
    var controllers = [NuimoController]()
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return controllers.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        switch tableColumn?.identifier {
        case NSUserInterfaceItemIdentifier("uuid"): return controllers[row].uuid
        case NSUserInterfaceItemIdentifier("state"): return [
            .connecting: "Connecting...",
            .connected: "Connected",
            .disconnecting: "Disconnecting...",
            .disconnected: "Disconnected"
            ][controllers[row].connectionState]
        default: return nil
        }
    }
}
