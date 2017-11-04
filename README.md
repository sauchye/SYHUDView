### About SYHUDView



![intro gif](https://github.com/sauchye/SYHUDView/raw/master/intro.gif)





``` objective-c
+ (void)showSuccessText:(NSString *)text;

+ (void)showFailureText:(NSString *)text;

+ (void)showInfoText:(NSString *)text;

+ (void)showLoadingWindowText:(NSString *)text;

+ (void)hide;

+ (SYProgressHUD *)showToLoadingView:(UIView *)view;

+ (SYProgressHUD *)showToCenterText:(NSString *)text;

+ (SYProgressHUD *)showToBottomText:(NSString *)text;

+ (SYProgressHUD *)showToCustomImage:(UIImage *)image
                                text:(NSString *)text;

+ (void)showStatusBarNotificationText:(NSString *)text;

+ (void)showNavigationBarNotificationText:(NSString *)text;


```

### Example, easy use:

``` 
    [SYProgressHUD showSuccessText:@"success"];

    [SYProgressHUD showLoadingWindowText:@"LoadingWindow"];

    [SYProgressHUD showToCenterText:@"CenterText"];
    [SYProgressHUD showToBottomText:@"BottomText"];

    [SYProgressHUD showToCustomImage:[UIImage imageNamed:@"nav_back_icon"] text:@"customImage"];
```

### Libraries

<a href="https://github.com/jdg/MBProgressHUD">MBProgressHUD</a>

<a href="https://github.com/cezarywojcik/CWStatusBarNotification">CWStatusBarNotification</a>