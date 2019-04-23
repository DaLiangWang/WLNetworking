//
//  WLHttpResponseModel.h
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLMacro.h"
@class WLHttpResponseToModel;

NS_ASSUME_NONNULL_BEGIN

/** 返回参数 */
@interface WLHttpResponseModel : NSObject
/** 原始数据 */
@property (nonatomic,strong) id responseData;
/** 模型数据 */
@property (nonatomic,strong) WLHttpResponseToModel *modelData;
@end

/** 模型数据 */
@interface WLHttpResponseToModel : WLHttpResponseModel
/** 模型数据 */
@property (nonatomic,strong) id models;
/** 错误码 */
@property (nonatomic,strong) NSString *code;
/** 提示消息 */
@property (nonatomic,strong) NSString *message;
@end

/** 请求失败 */
@interface WLHttpResponseErrorModel : WLHttpResponseModel
@property (nonatomic,strong) NSError *error;
@end

/** 进度 */
@interface WLHttpResponseRrogressModel : WLHttpResponseModel
@property (nonatomic,strong) NSProgress *progress;
@end


NS_ASSUME_NONNULL_END
