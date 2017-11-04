//
//  SYProgressHUD.m
//  SYHUDView
//
//  Created by Saucheong Ye on 8/12/15.
//  Copyright © 2015 sauchye.com. All rights reserved.
//

//


#define kCURRENT_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define kCURRENT_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define kKeyWindows [UIApplication sharedApplication].keyWindow
#define kHudFont(fontSize) [UIFont systemFontOfSize:fontSize]
#define kAllocProgressHUD [SYProgressHUD showHUDAddedTo:kKeyWindows animated:YES]
#define Image(imageName) [UIImage imageNamed:imageName]
#define kAppBlueColor [UIColor orangeColor]




#import "SYProgressHUD.h"

static CGFloat const delyedTime = 2.0;
static CGFloat const MIN_WIDTH  = 120.0f;
static CGFloat const kHudDetailFontSize  = 14.f;
static CGFloat const kHudFontSize        = 15.f;

@implementation SYProgressHUD

+ (void)showStatus:(SYProgressHUDStatus)status
              text:(NSString *)text
              hide:(NSTimeInterval)time{
    
    SYProgressHUD *hud = kAllocProgressHUD;
    [hud showAnimated:YES];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = kHudFont(kHudDetailFontSize);
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setMinSize:CGSizeMake(MIN_WIDTH, MIN_WIDTH)];
    [kKeyWindows addSubview:hud];
    
    switch (status) {
        case SYProgressHUDStatusSuccess: {
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *successView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_success"]];
            hud.customView = successView;
            [hud hideAnimated:YES afterDelay:delyedTime];
        }
            break;
            
        case SYProgressHUDStatusFailure: {
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *errorView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_error"]];
            hud.customView = errorView;
            [hud hideAnimated:YES afterDelay:delyedTime];
        }
            break;
            
        case SYProgressHUDStatusInfo: {
            
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_info"]];
            hud.customView = infoView;
            [hud hideAnimated:YES afterDelay:delyedTime];
        }
            break;
            
        case SYProgressHUDStatusLoading:{
            hud.mode = MBProgressHUDModeIndeterminate;
        }
            break;
            
        default:
            break;
    }
}

+ (void)showText:(NSString *)text
            icon:(UIImage *)icon{
    SYProgressHUD *hud = kAllocProgressHUD;
    [hud showAnimated:YES];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = kHudFont(kHudDetailFontSize);
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setMinSize:CGSizeMake(MIN_WIDTH, MIN_WIDTH)];
    [kKeyWindows addSubview:hud];
    
    hud.mode = MBProgressHUDModeCustomView;
    UIImageView *successView = [[UIImageView alloc] initWithImage:icon];
    hud.customView = successView;
    [hud hideAnimated:YES afterDelay:delyedTime];
}

+ (void)showSuccessText:(NSString *)text{
    
    [self showStatus:SYProgressHUDStatusSuccess text:text hide:delyedTime];
}

+ (void)showFailureText:(NSString *)text{
    
    [self showStatus:SYProgressHUDStatusFailure text:text hide:delyedTime];
}

+ (void)showInfoText:(NSString *)text{
    
    [self showStatus:SYProgressHUDStatusInfo text:text hide:delyedTime];
}

+ (void)showLoadingWindowText:(NSString *)text{
    
    [self showStatus:SYProgressHUDStatusLoading text:text hide:delyedTime];
}

+ (void)hide{
    
    [SYProgressHUD hideHUDForView:kKeyWindows animated:YES];
}


+ (SYProgressHUD *)showToLoadingView:(UIView *)view{
    SYProgressHUD *hud = [SYProgressHUD showHUDAddedTo:view animated:YES];
    [view addSubview:hud];
    hud.label.font = kHudFont(kHudDetailFontSize);
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.mode = MBProgressHUDModeIndeterminate;
    return hud;
}

+ (SYProgressHUD *)showToCenterText:(NSString *)text{
    
    SYProgressHUD *hud = kAllocProgressHUD;
    hud.detailsLabel.font = kHudFont(kHudDetailFontSize);
    hud.detailsLabel.text = text;
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    hud.animationType = MBProgressHUDAnimationZoom;
    //    [hud setMinSize:CGSizeMake(MIN_WIDTH, 30)];
    [kKeyWindows addSubview:hud];
    dispatch_async(dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES afterDelay:delyedTime];
    });
    
    return hud;
}

+ (SYProgressHUD *)showToBottomText:(NSString *)text{
    
    SYProgressHUD *hud = kAllocProgressHUD;
    hud.detailsLabel.font = kHudFont(kHudDetailFontSize);
    hud.detailsLabel.text = text;
    hud.mode = MBProgressHUDModeText;
    //    hud.margin = 10.0f;
    CGFloat bottomSpaceY = 0.0;
    if (kCURRENT_SCREEN_HEIGHT == 480) {
        bottomSpaceY = 150.0f;
    }else if(kCURRENT_SCREEN_HEIGHT == 568){
        bottomSpaceY = 180.0f;
    }else{
        bottomSpaceY = 200.0f;
    }
    //hud.offset.y = bottomSpaceY;
    hud.removeFromSuperViewOnHide = YES;
    hud.animationType = MBProgressHUDAnimationFade;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [kKeyWindows addSubview:hud];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES afterDelay:delyedTime];
        });
    });
    return hud;
}

+ (SYProgressHUD *)showToBottom30Text:(NSString *)text{
    
    SYProgressHUD *hud = [self showToBottomText:text];
    
    CGFloat bottomSpaceY = 0.0;
    if (kCURRENT_SCREEN_HEIGHT == 480) {
        bottomSpaceY = 150.0f + 65;
    }else if(kCURRENT_SCREEN_HEIGHT == 568){
        bottomSpaceY = 180.0f + 75;
    }else{
        bottomSpaceY = 200.0f + 115;
    }
    //hud.offset.y = bottomSpaceY;
    return hud;
}

+ (SYProgressHUD *)showToCustomImage:(UIImage *)image
                                text:(NSString *)text{
    
    SYProgressHUD *hud = kAllocProgressHUD;
    [kKeyWindows addSubview:hud];
    hud.mode = MBProgressHUDModeCustomView;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.label.font = kHudFont(kHudFontSize);
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:1];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delyedTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud removeFromSuperview];
    });
    //    [hud showAnimated:YES whileExecutingBlock:^{
    //        sleep(delyedTime);
    //    } completionBlock:^{
    //        [hud removeFromSuperview];
    //    }];
    
    return hud;
}

@end

#pragma mark - SYStatusBarNotification
@implementation SYStatusBarNotification


+ (SYStatusBarNotification *)showNotificationStyle:(CWNotificationStyle)notificationStyle
                               textBackgroundColor:(UIColor *)textBackgroundColor
                                          fontSize:(CGFloat)fontSize
                                              text:(NSString *)text
                                              hide:(NSTimeInterval)time{
    
    SYStatusBarNotification *navNotification = [SYStatusBarNotification new];
    navNotification.notificationStyle = notificationStyle;
    navNotification.notificationLabelFont = [UIFont systemFontOfSize:fontSize];
    navNotification.notificationLabelBackgroundColor = textBackgroundColor;
    [navNotification displayNotificationWithMessage:text forDuration:time];
    
    return navNotification;
}

+ (void)showStatusBarNotificationText:(NSString *)text
                  textBackgroundColor:(UIColor *)textBackgroundColor
                             fontSize:(CGFloat)fontSize{
    
    [self showNotificationStyle:CWNotificationStyleStatusBarNotification
            textBackgroundColor:textBackgroundColor
                       fontSize:fontSize
                           text:text
                           hide:delyedTime];
}

+ (void)showNavigationBarNotificationText:(NSString *)text
                      textBackgroundColor:(UIColor *)textBackgroundColor
                                 fontSize:(CGFloat)fontSize{
    
    [self showNotificationStyle:CWNotificationStyleNavigationBarNotification
            textBackgroundColor:textBackgroundColor
                       fontSize:kHudFontSize
                           text:text
                           hide:delyedTime];
}

+ (void)showStatusBarNotificationText:(NSString *)text{
    [self showStatusBarNotificationText:text
                    textBackgroundColor:kAppBlueColor
                               fontSize:kHudFontSize];
}


+ (void)showNavigationBarNotificationText:(NSString *)text{
    
    [self showNavigationBarNotificationText:text
                        textBackgroundColor:kAppBlueColor
                                   fontSize:kHudFontSize];
}

@end


