//
//  WLLoginModel.h
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import "WLHttpRequestModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WLLoginModel : WLHttpRequestModel
@property (nonatomic,strong) NSString *cell;
@property (nonatomic,strong) NSString *corpName;
@property (nonatomic,strong) NSString *firstName;
@property (nonatomic,strong) NSString *mail;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *showName;

@end

NS_ASSUME_NONNULL_END
