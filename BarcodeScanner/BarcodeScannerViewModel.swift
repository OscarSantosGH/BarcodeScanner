//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Oscar Santos on 11/8/20.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
}
