//
//  I2HttpService.m
//  I2DESIGN
//
//  Created by 适途科技 on 2018/4/17.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "WLHttpService.h"
#import "WLDataToModel.h"
#import "WLHttpRequestModel.h"
#import "WLHttpResponseModel.h"
#import "WLShowBMP.h"

@implementation WLHttpService

+ (instancetype)sharedInstance
{
  static WLHttpService *httpService = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    httpService = [[WLHttpService alloc]init];
  });
  return httpService;
}

- (void)doRequestModel:(WLHttpRequestModel *)requestModel
              progress:(progress_wl)progress
               success:(success_wl)success
               failure:(failure_wl)failure{
    AFHTTPSessionManager *manager = requestModel.manager;
    NSString *url = requestModel.url;
    NSDictionary *parame = requestModel.parame;
    requestType_wl requestType = requestModel.requestType;
    
    WLHttpAppLog(@"------------开始请求------------");
    WLHttpAppLog(@"请求地址:%@",url);
    WLHttpAppLog(@"请求参数:%@",parame);
    WLHttpAppLog(@"请求类型:%ld",requestType);
    WLHttpAppLog(@"时间:%@",[NSDate new]);
    WLHttpAppLog(@"------------------------------");
    if (requestType == get_wl) {
        [manager GET:url parameters:parame progress:^(NSProgress * _Nonnull downloadProgress) {
            [self progressRequestModel:requestModel progress:downloadProgress progressBlock:progress];
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self successRequestModel:requestModel Task:task responseObject:responseObject success:success failure:failure];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self failureRequestModel:requestModel Task:task responseObject:nil error:error failure:failure];
        }];
    } else if (requestType == post_wl){
        [manager POST:url parameters:parame progress:^(NSProgress * _Nonnull uploadProgress) {
            [self progressRequestModel:requestModel progress:uploadProgress progressBlock:progress];
        } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
            [self successRequestModel:requestModel Task:task responseObject:responseObject success:success failure:failure];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self failureRequestModel:requestModel Task:task responseObject:nil error:error failure:failure];
        }];
    } else if (requestType == put_wl){
        [manager PUT:url parameters:parame success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self successRequestModel:requestModel Task:task responseObject:responseObject success:success failure:failure];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self failureRequestModel:requestModel Task:task responseObject:nil error:error failure:failure];
        }];
    }
}


-(void)progressRequestModel:(WLHttpRequestModel *)requestModel
                   progress:(NSProgress *)progress
              progressBlock:(progress_wl)progressBlock{
    
    WLHttpResponseRrogressModel *responseModel = [[WLHttpResponseRrogressModel alloc]init];
    responseModel.progress = progress;
    
    if (progressBlock) {
        progressBlock(responseModel);
    }
}
-(void)successRequestModel:(WLHttpRequestModel *)requestModel
                      Task:(NSURLSessionDataTask *)task
            responseObject:(id)responseObject
                   success:(success_wl)successBlock
                   failure:(failure_wl)failureBlock{
    
    if (requestModel.toModel.codeKey) {
        NSInteger code = [[responseObject objectForKey:requestModel.toModel.codeKey] integerValue];
        if (code != requestModel.toModel.successCode) {
            NSString *message = [responseObject objectForKey:requestModel.toModel.messageKey];
            [self failureRequestModel:requestModel
                                 Task:task
                       responseObject:responseObject
                                error:[NSError errorWithDomain:message code:code userInfo:responseObject]
                              failure:failureBlock];
            return;
        }
    }
    
    WLHttpAppLog(@"------------请求成功------------");
    WLHttpAppLog(@"请求地址:%@",requestModel.url);
    WLHttpAppLog(@"数据:%@",responseObject);
    WLHttpAppLog(@"时间:%@",[NSDate new]);
    WLHttpAppLog(@"------------------------------");

    WLHttpResponseModel *responseModel = [[WLHttpResponseModel alloc]init];
    responseModel.responseData = responseObject;
    responseModel.modelData = [WLDataToModel dataToModel:requestModel.toModel data:responseObject];
    
    
    if (successBlock) {
        successBlock(responseModel);
    }
}
-(void)failureRequestModel:(WLHttpRequestModel *)requestModel
                      Task:(NSURLSessionDataTask *)task
            responseObject:(id)responseObject
                     error:(NSError *)error
                   failure:(failure_wl)failureBlock{
    WLHttpAppLog(@"------------请求失败------------");
    WLHttpAppLog(@"请求地址:%@",requestModel.url);
    WLHttpAppLog(@"错误:%@",error);
    WLHttpAppLog(@"时间:%@",[NSDate new]);
    WLHttpAppLog(@"------------------------------");
    WLHttpResponseErrorModel *responseModel = [[WLHttpResponseErrorModel alloc]init];
    responseModel.error = error;
    
    if (failureBlock) {
        failureBlock(responseModel);
    } else if (responseObject) {
        if (requestModel.toModel.messageKey && requestModel.toModel.codeKey) {
            [WLShowBMP showError_wl:[responseObject objectForKey:requestModel.toModel.messageKey]];
        } else {
            WLHttpAppLog(@"没有设置判断的CodeKey 和 messageKey");
        }
    } else {
        [WLShowBMP showError_wl:@"网络错误"];
    }
}


@end
