//
//  CounterEvent.swift
//  nativeModules
//
//  Created by somveer kumar on 31/12/23.
//

import Foundation
@objc(CounterEvent)
class CounterEvent: RCTEventEmitter {
  private var count = 0;
 
  
  @objc
  func increment(_ callback: RCTResponseSenderBlock){
    count+=1;
    callback([count]);
    sendEvent(withName: "onIncrement", body: ["Count increased",count]);
  }
  @objc
  static override func requiresMainQueueSetup() -> Bool {
    return true;
  }

  override func supportedEvents() -> [String]! {
    return ["onIncrement","onDecrement"];
  }
  @objc
  override func constantsToExport() -> [AnyHashable : Any]! {
    return ["initialCount":0];
  }
  
  
  @objc
  func decrement(_ resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock){
    if(count == 0){
      let error = NSError(domain: "", code: 200, userInfo: nil);
      reject("ERROR_COUNT","Count can not be negative",error);
    }else{
      count-=1;
      resolve("count \(count)");
      sendEvent(withName: "onDecrement", body: ["Count decrease",count]);
    }
  }
 
}
