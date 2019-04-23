//
//  WLShowBMP.m
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import "WLShowBMP.h"
#import "WLMacro.h"

@implementation WLShowBMP
+(void)showError_wl:(NSString *)error{
    WLHttpAppLog(@"-------------%@-----------------",error);

}
+(void)showSuccess_wl:(NSString *)success{
    WLHttpAppLog(@"-------------%@-----------------",success);

}
@end
