//
//  MainViewModel.swift
//  BLEScanning
//
//  Created by Jin Wook Yang on 2023/04/17.
//

import Foundation
import RxCocoa
import RxSwift
import CoreBluetooth
import UIKit


struct BLEServiceID {
    
    static let ADBUIID = CBUUID(string: "56260000-5EEC-428E-B095-A366AEA6CDDB")
    static let CONNECTID = CBUUID(string: "-5EEC-428E-B095-A366AEA6CDDB")
    
    
}


/// BLE Main Moule
class MainViewModel : NSObject {
    
    var centralManager : CBCentralManager!
    let centralQueue = DispatchQueue.global(qos: .userInitiated)
    
    var discoveredPripheral : CBPeripheral?

        
    override init() {
        super.init()
        self.InitCBCentralManager()
    }
    
    
    func InitCBCentralManager() {
        
        let options : [String : Any] = [CBCentralManagerOptionShowPowerAlertKey : BLEServiceID.ADBUIID]
        //BLE Init
        centralManager = CBCentralManager(delegate: self, queue: centralQueue, options :options)
        
    }
    
    
    func StartScaing() {
        
        //let scanTime = Date().timeIntervalSince1970
        let scanList = [BLEServiceID.ADBUIID]
        if (centralManager != nil) {
            centralManager.scanForPeripherals(withServices: scanList, options : [CBCentralManagerScanOptionAllowDuplicatesKey : false])
        }
    }
  
}

extension MainViewModel : CBCentralManagerDelegate {
   
    
    
    internal func centralManagerDidUpdateState(_ central : CBCentralManager ) { //내부에서만 접근가능
      
        Logger.ble("Call Central Manager Did State \(central.state)")
        
        switch central.state {
            
        case .poweredOn :
            return
        case .poweredOff:
            return
        case .resetting:
            return
        case .unauthorized:
            HandelCBUnauthorized()
            return
        case .unsupported:
            return
        case .unknown:
            return
        @unknown default :
            return
            
        }
    }
    
    internal func HandelCBUnauthorized() {
        
        switch CBManager.authorization {
            
        case .denied :
            Logger.ble("Authorize Denied")
        case .allowedAlways :
            Logger.ble("Authorize allowedAlways")
        case .restricted :
            Logger.ble("Authorize restricted")
        case .notDetermined :
            Logger.ble("Authorize notDetermined")
        default :
            Logger.ble("Authorize UnKnown")
        }
    }
    
    
    
    
}
