//
//  BLEEntites.swift
//  BLEScanning
//
//  Created by Jin Wook Yang on 2023/04/26.
//

import Foundation


struct BLEElement : Equatable {
    
    let id : String
    let uuid : String
    let subuuid : String?
    let rssi : Int
    
}
