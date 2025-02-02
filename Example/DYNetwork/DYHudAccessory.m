//
//  DYHudAccessoryView.m
//  DYNetwork_Example
//
//  Created by 德一智慧城市 on 2019/6/25.
//  Copyright © 2019 昌. All rights reserved.
//h

#import "DYHudAccessory.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface DYHudAccessory ()

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation DYHudAccessory

- (instancetype)initWithView:(UIView *)view msg:(NSString *)msg {
    if (self = [super init]) {
        _hud = [[MBProgressHUD alloc] initWithView:view];
        [view addSubview:_hud];
        if (msg) {
            _hud.label.text = msg;
        }
    }
    return self;
}

- (void)networkRequestAccessoryWillStart {
    [_hud showAnimated:YES];
}

- (void)networkRequestAccessoryByStatus:(DYNetworkStatus)networkStatus {
    switch (networkStatus) {
        case DYNetworkResponseDataSuccessStatus:
            {
                [_hud hideAnimated:YES];
            }
            break;
            
        default:
        {
            [_hud hideAnimated:YES afterDelay:0.3];
        }
            break;
    }
}

- (void)networkRequestAccessoryDidFinish {
    [_hud hideAnimated:YES afterDelay:0.3];
}

- (void)networkRequestAccessoryDidEndByResponse:(DYNetworkResponse *)response {
    
}

@end
