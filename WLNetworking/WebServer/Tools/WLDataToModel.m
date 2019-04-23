//
//  WLDataToModel.m
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import "WLDataToModel.h"
#import <YYModel.h>
#import "WLHttpResponseModel.h"

@implementation WLDataToModel
+(id)dataToModel:(WLHttpRequestToModel*)model data:(id)data{
    if ([model isTransformation]) {
        WLHttpResponseToModel *modelData = [[WLHttpResponseToModel alloc]init];
        modelData.models = [model.className yy_modelWithJSON:[data objectForKey:model.dataKey]];
        modelData.code = [data objectForKey:model.codeKey];
        modelData.message = [data objectForKey:model.messageKey];
        return modelData;
    } else {
        return NULL;
    }
}
+(void)generatedModel:(Class)className data:(id)data{
    
}
@end
