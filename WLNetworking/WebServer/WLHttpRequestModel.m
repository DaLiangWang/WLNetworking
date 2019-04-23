//
//  WLHttpRequestModel.m
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import "WLHttpRequestModel.h"
#import "WLHttpService.h"

@implementation WLHttpRequestModel
+ (instancetype)sharedParame:(NSDictionary *)parame{
    return [[self.class alloc] initWithParame:parame];
}
-(instancetype)initWithParame:(NSDictionary *)parame{
    self = [super init];
    if (self) {
        self.parame = parame;
    }
    return self;
}
-(AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [WLSharedManager sharedJsonManagerOtherData:self.requestData];
    }
    return _manager;
}
-(NSDictionary *)requestData{
    if (!_requestData) {
        _requestData = [NSDictionary dictionary];
    }
    return _requestData;
}



- (void)doRequestSuccess:(success_wl)success{
    [self doRequestProgress:nil success:success failure:nil];
}
- (void)doRequestSuccess:(success_wl)success
                 failure:(failure_wl)failure{
    [self doRequestProgress:nil success:success failure:failure];
}
- (void)doRequestProgress:(progress_wl)progress
                  success:(success_wl)success
                  failure:(failure_wl)failure{
    [[WLHttpService sharedInstance] doRequestModel:self progress:progress success:success failure:failure];
}

@end
@implementation WLHttpRequestToModel
/**  */
-(BOOL)isTransformation{
    return (self.dataKey && self.codeKey && self.messageKey && self.className);
}
@end
