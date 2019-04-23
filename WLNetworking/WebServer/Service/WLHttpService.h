//
//  I2HttpService.h
//  I2DESIGN
//
//  Created by 适途科技 on 2018/4/17.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLMacro.h"

@class WLHttpRequestModel;
@interface WLHttpService : NSObject

+ (instancetype)sharedInstance;

- (void)doRequestModel:(WLHttpRequestModel *)requestModel
              progress:(progress_wl)progress
               success:(success_wl)success
               failure:(failure_wl)failure;
@end
