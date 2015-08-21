### About SYHudView

Based MBProgrssHUD Package, easy use.

鉴于MBProgrssHUD在项目中的需求，所以基于MBProgrssHUD再次封装，用起来真特么的爽。



![intro gif](https://github.com/sauchye/SYHUDView/blob/master/intro.gif)



- package MBProgrssHUD(封装MBProgressHUD，更易用)<br/>

	

		+ (SYHUDView *)showToView:(UIView *)view text:(NSString *)text hide:(NSTimeInterval)time;

		+ (SYHUDView *)showToBottomView:(UIView *)view text:(NSString *)text hide:(NSTimeInterval)time;

		+ (SYHUDView *)showToView:(UIView *)view success:(BOOL)isSuccess  text:(NSString *)text hide:(NSTimeInterval)time;

		+ (SYHUDView *)showToView:(UIView *)view customImage:(UIImage *)image text:(NSString *)text hide:(NSTimeInterval)time;

		

		+ (SYHUDView *)showToView:(UIView *)view;

	

	Example, easy use:

	

	 	

		[SYHUDView showToView:self.view text:@"Success" hide:2.0];

		[SYHUDView showToView:self.view success:YES text:@"Success" hide:2.0];

		[SYHUDView showToBottomView:self.view text:@"bottom Success" hide:2.0];

		[SYHUDView showToView:self.view customImage:[UIImage imageNamed:@"nav_back_icon"] text:@"customImage" hide:2.0];

		SYHUDView *hud = [SYHUDView showToView:self.view];

		[hud hide:YES afterDelay:2.0]; 


And has many not finished...


- welcome to star, fork, pull request or issues.

### Support

与MBProgressHUD支持一致吧，毕竟基于它封装。

### Libraries

<a href="https://github.com/jdg/MBProgressHUD">MBProgressHUD</a>



### License

SYHUDView is licensed under the MIT License.