//
//  ViewController.m
//  WLNetworking
//
//  Created by 适途科技二 on 2019/4/16.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import "ViewController.h"
#import "WLLoginModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{@"cellphone":@"15011111111",
                         @"password":@"1"};

    [[WLLoginModel sharedParame:dic] doRequestSuccess:^(WLHttpResponseModel *model) {
        
        NSLog(@"%@",model.modelData);
        NSLog(@"22");
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}


@end
