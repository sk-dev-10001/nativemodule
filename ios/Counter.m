//
//  Counter.m
//  nativeModules
//
//  Created by somveer kumar on 31/12/23.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(Counter, NSObject);
RCT_EXTERN_METHOD(Increment:(RCTResponseSenderBlock)callback);
RCT_EXTERN_METHOD(Decrement:(RCTPromiseResolveBlock)resolve reject : (RCTPromiseRejectBlock)reject);
@end
