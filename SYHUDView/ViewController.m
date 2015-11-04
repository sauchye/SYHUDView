//
//  ViewController.m
//  SYHUDView
//
//  Created by Sauchye on 8/20/15.
//  Copyright © 2015 sauchye.com. All rights reserved.
//

#import "ViewController.h"
#import "SYProgressHUD.h"

static CGFloat const delyedTime = 2.0;


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
    [hud hide:YES afterDelay:delyedTime];
//    [SYProgressHUD showLoadingWindowText:@"LoadingWindow"];
//    [NSTimer scheduledTimerWithTimeInterval:delyedTime
//                                     target:self
//                                   selector:@selector(hideHUD)
//                                   userInfo:nil
//                                    repeats:NO];
}

- (IBAction)customImage:(id)sender {
    
    [SYProgressHUD showToCustomImage:[UIImage imageNamed:@"nav_back_icon"] text:@"This  custom image"];

}
- (IBAction)labelText:(id)sender {
    [SYProgressHUD showToCenterText:@"CenterText\nwigeqiegiwuqfeguwfqeu"];
    [SYProgressHUD showToBottomText:@"BottomText\nskadgiuagdiusafuydfasudfusaydfu"];
}
- (IBAction)successImage:(id)sender {
    
    [SYProgressHUD showSuccessText:@"success"];
//    [SYProgressHUD showFailureText:@"faiure"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
