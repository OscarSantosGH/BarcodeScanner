//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Oscar Santos on 11/7/20.
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

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 100)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.scannedCode.isEmpty ? "Not Yet Scanned" : viewModel.scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            
            .alert(item: $viewModel.alertItem){ alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
