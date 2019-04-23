//
//  WLDataToModel.h
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLHttpRequestModel.h"
#import "WLHttpResponseModel.h"
NS_ASSUME_NONNULL_BEGIN
/** 统一数据转模型 */
@interface WLDataToModel : NSObject
/** 数据转模型 */
+(id)dataToModel:(WLHttpRequestToModel*)model
            data:(id)data;

/** 生成模型文件 */
+(void)generatedModel:(Class)className data:(id)data;
@end

NS_ASSUME_NONNULL_END
