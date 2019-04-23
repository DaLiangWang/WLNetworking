//
//  WLHttpRequestModel.h
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLMacro.h"
#import "WLSharedManager.h"
#import "WLHttpResponseModel.h"

NS_ASSUME_NONNULL_BEGIN



@class WLHttpRequestToModel;
/** 请求参数 */
@interface WLHttpRequestModel : NSObject
/** 请求工具类 */
@property (nonatomic,strong) AFHTTPSessionManager *manager;
/** 额外请求头参数 */
@property (nonatomic,strong) NSDictionary *requestData;
/** 请求地址 */
@property (nonatomic,strong) NSString *url;
/** 请求参数 */
@property (nonatomic,strong) NSDictionary *parame;
/** 请求方式 */
@property (nonatomic,assign) requestType_wl requestType;

#pragma -- 其他参数
/** 数据转模型参数 */
@property (nonatomic,strong) WLHttpRequestToModel *toModel;



- (void)doRequestSuccess:(success_wl)success;
- (void)doRequestSuccess:(success_wl)success
                  failure:(failure_wl)failure;
- (void)doRequestProgress:(progress_wl)progress
                  success:(success_wl)success
                  failure:(failure_wl)failure;

+ (instancetype)sharedParame:(NSDictionary *)parame;
-(instancetype)initWithParame:(NSDictionary *)parame;
@end

@interface WLHttpRequestToModel : NSObject
/** 元数据key */
@property (nonatomic,strong) NSString *dataKey;
/** 元数据错误码key */
@property (nonatomic,strong) NSString *codeKey;
//请求成功code 默认零
@property (nonatomic,assign) NSInteger successCode;
/** 元数据messageKey */
@property (nonatomic,strong) NSString *messageKey;
/** 元数据对应模型class */
@property (nonatomic,strong) Class className;
/**  */
-(BOOL)isTransformation;
@end
NS_ASSUME_NONNULL_END
