//
//  CounterEvent.m
//  nativeModules
//
//  Created by somveer kumar on 31/12/23.
//

#import <Foundation/Foundation.h>
#import <React/RCTEventEmitter.h>



@interface RCT_EXTERN_MODULE(CounterEvent,RCTEventEmitter);
RCT_EXTERN_METHOD(increment:(RCTResponseSenderBlock)callback);
RCT_EXTERN_METHOD(decrement:(RCTPromiseResolveBlock)resolve reject: (RCTPromiseRejectBlock)reject);
@end;

