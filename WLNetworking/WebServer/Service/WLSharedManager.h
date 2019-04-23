//
//  WLSharedManager.h
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLSharedManager : NSObject
/** json数据传输 */
+ (AFHTTPSessionManager *)sharedJsonManagerOtherData:(NSDictionary *)otherData;
/** 二进制数据传输 */
+ (AFHTTPSessionManager *)sharedHttpManagerOtherData:(NSDictionary *)otherData;
@end

NS_ASSUME_NONNULL_END
