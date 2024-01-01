//
//  Counter.swift
//  nativeModules
//
//  Created by somveer kumar on 31/12/23.
//

import Foundation
@objc(Counter)
class Counter : NSObject {
  private var count = 0;
  @objc
  func Increment(_ callback : RCTResponseSenderBlock) {
    count+=1;
    callback([count]);
  }
  @objc
  static func requiresMainQueueSetup() -> Bool{
    return true;
  }
  
  @objc
  func constantsToExport() -> [String:Any]!{
    return ["initialCount":0];
  }
  
  @objc
  func Decrement(_ resolve : RCTPromiseResolveBlock,reject : RCTPromiseRejectBlock){
    if(count == 0){
      let error = NSError(domain: "", code: 200,userInfo: nil);
      reject("ERROR_COUNT","Count can not be negative",error);
    }else{
      count-=1;
      resolve("count \(count)");
    }
  }
}
