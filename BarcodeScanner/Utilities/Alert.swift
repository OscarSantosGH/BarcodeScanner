//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Oscar Santos on 11/8/20.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Something is wrong with the camera",
                                       message: "We are unable to capture the input.",
                                       dismissButton: .default(Text("OK")))
    static let invalidScannedValue = AlertItem(title: "The value scanned is not valid",
                                        message: "This app scans EAN-- and EAN-13.",
                                        dismissButton: .default(Text("OK")))
}
