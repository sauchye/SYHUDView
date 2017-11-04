//
//  ViewController.m
//  SYHUDView
//
//  Created by Sauchye on 8/20/15.
//  Copyright © 2015 sauchye.com. All rights reserved.
//

#import "ViewController.h"
#import "SYProgressHUD.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)hideHUD{
    
    [SYProgressHUD hide];
    [SYProgressHUD showSuccessText:@"success"];

}
#pragma mark - Example
- (IBAction)indicatorView:(id)sender {

    
    SYProgressHUD *hud =  [SYProgressHUD showToLoadingView:self.view];
    [hud hideAnimated:YES afterDelay:2.f];
    //hud.bezelView.backgroundColor = [UIColor blackColor];
}

- (IBAction)customImage:(id)sender {
    [SYProgressHUD showToCustomImage:[UIImage imageNamed:@"nav_back_icon"] text:@"customImage"];
}

- (IBAction)labelText:(id)sender {
    [SYProgressHUD showToCenterText:@"CenterText\nwigeqiegiwuqfeguwfqeu"];
//    [SYProgressHUD showToBottomText:@"BottomText\nskadgiuagdiusafuydfasudfusaydfu"];
}

- (IBAction)successImage:(id)sender {
    [SYProgressHUD showSuccessText:@"success"];
}

- (IBAction)navigationTextTips:(id)sender {
    [SYStatusBarNotification showNavigationBarNotificationText:@"nav tt test"];
}

- (IBAction)statusBarTextTips:(id)sender {
    [SYStatusBarNotification showStatusBarNotificationText:@"tt test"];
}


@end
