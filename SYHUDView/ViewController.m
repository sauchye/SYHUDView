//
//  ViewController.m
//  SYHUDView
//
//  Created by Sauchye on 8/20/15.
//  Copyright © 2015 sauchye.com. All rights reserved.
//

#import "ViewController.h"
#import "SYHUDView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - Example
- (IBAction)indicatorView:(id)sender {
    
    SYHUDView *hud = [SYHUDView showToView:self.view];
    [hud hide:YES afterDelay:2.0];
}
- (IBAction)customImage:(id)sender {
    
    [SYHUDView showToView:self.view customImage:[UIImage imageNamed:@"nav_back_icon"] text:@"customImage" hide:2.0];

}
- (IBAction)labelText:(id)sender {
    
    [SYHUDView showToBottomView:self.view text:@"bottom info" hide:2.0];
    [SYHUDView showToView:self.view text:@"center info" hide:2.0];
}
- (IBAction)successImage:(id)sender {
    [SYHUDView showToView:self.view success:YES text:@"Success" hide:2.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
