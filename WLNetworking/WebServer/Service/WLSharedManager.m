//
//  WLSharedManager.m
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import "WLSharedManager.h"

@implementation WLSharedManager

+ (AFHTTPSessionManager *)sharedJsonManagerOtherData:(NSDictionary *)otherData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //最大请求并发任务数
    manager.operationQueue.maxConcurrentOperationCount = 5;
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.stringEncoding = kCFStringEncodingUTF8;
    // 超时时间
    manager.requestSerializer.timeoutInterval = 10.0f;
    // 设置请求头
    [manager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    // 设置接收的Content-Type
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//返回格式 JSON
    //设置返回Content-type
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    
    return manager;
}
+ (AFHTTPSessionManager *)sharedHttpManagerOtherData:(NSDictionary *)otherData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //最大请求并发任务数
    manager.operationQueue.maxConcurrentOperationCount = 5;
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 调用post会报错
    manager.requestSerializer.stringEncoding = kCFStringEncodingUTF8;
    // 超时时间
    manager.requestSerializer.timeoutInterval = 10.0f;
    // 设置请求头
    [manager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//返回格式 JSON
    //设置返回Content-type
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    
    return manager;
}
@end
