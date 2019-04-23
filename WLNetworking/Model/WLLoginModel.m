//
//  WLLoginModel.m
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import "WLLoginModel.h"

@implementation WLLoginModel
-(AFHTTPSessionManager *)manager{
    return [WLSharedManager sharedHttpManagerOtherData:self.requestData];
}
-(NSString *)url{
    return @"https://i2wenwen.cn:8543/MobileApp/Common/Public/login.do";
}
-(WLHttpRequestToModel *)toModel{
    if (!super.toModel) {
        WLHttpRequestToModel *toModel = [[WLHttpRequestToModel alloc]init];
        toModel.codeKey = @"code";
        toModel.messageKey = @"message";
        toModel.dataKey = @"data";
        toModel.className = self.class;
        super.toModel = toModel;
    }
    return super.toModel;
}
//-(NSDictionary *)parame{
//    return @{@"cellphone":@"15011111111",
//             @"password":@"1"};
//}
-(requestType_wl)requestType{
    return post_wl;
}
@end
