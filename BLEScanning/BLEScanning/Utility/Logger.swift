//
//  Logger.swift
//  BLEScanning
//
//  Created by Jin Wook Yang on 2023/04/22.
//

import Foundation
import os


let logger = os.Logger(subsystem: "com.BleUtil", category: "DataChannel")

struct createTextFile:TextOutputStream {
    mutating func write(_ string: String){
        let paths = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        let documentDirectoryPath = paths.first!
        let log = documentDirectoryPath.appendingPathComponent("bleLog.txt")
        do{
            let handle = try FileHandle(forWritingTo: log)
            handle.seekToEndOfFile()
            handle.write(string.data(using: .utf8)!)
            handle.closeFile()
        }catch{
            print(error.localizedDescription)
            do{
                try string.data(using: .utf8)?.write(to: log)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}


let logflag = true
public enum Logger {
    public static func print(_ string: String) {
        if logflag {
            debugPrint("YANG:\(string)")
        }
    }
    
    public static func ui(_ string: String) {
        if logflag {
            debugPrint("UI:\(string)")
        }
    }
    
    public static func widget(_ string : String) {
        if logflag {
            debugPrint("WIDGET:\(string)")
        }
    }
    
    public static func WatchOS(_ string : String) {
        if logflag {
            debugPrint("WATCHOS:\(string)")
        }
    }
    
    public static func ble(_ string: String) {
        if logflag {
            logger.info("BLELOG:\(string)")
        }
    }
    
    public static func backtask(_ log : String) {
        if logflag {
            logger.info("BACK:\(log)")
           // writefile(log)
        }
    }
    
    public static func uwb(_ string: String) {
        if logflag {
            logger.info("UWB:\(string)")
           // writefile(string)
        }
    }
    
    public static func watch(_ string: String) {
        if logflag {
            logger.info("WATCH:\(string)")
           // writefile(string)
        }
    }
    
    public static func packet(_ string: String, tx_rx : Bool) {
        if logflag {
            if tx_rx {
                logger.info("Data:->W \(string)")
            }else{
                logger.info("Data:->R \(string)")
            }
           // writefile(string)
        }
    }
    
    public static func net(_ string : String ){
        if logflag {
            logger.info("NET : \(string)")
        }
    }
    
    public static func push(_ string : String ){
        if logflag {
            logger.info("PUSH : \(string)")
        }
    }
    
    public static func guest(_ string : String ){
        if logflag {
            logger.info("GUEST : \(string)")
        }
    }
    
    public static func gps(_ string : String ){
        if logflag {
            logger.info("GPS : \(string)")
        }
    }
    
    public static func writefile(_ string : String){
        if logflag {
           var result_write_value = ""
           //현재시간 구하기(년/월/일/초)
           let formatter = DateFormatter()
           formatter.dateFormat = "hh:mm:ss"
            let current_date_string = formatter.string(from: Date())
           //TEST CODE
           var textLog = createTextFile()
           result_write_value = "\(current_date_string) : \(string)"
           textLog.write("\(result_write_value)\n")
         }
    }
    
  
}
