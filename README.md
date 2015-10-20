### About SYHUDView

Based MBProgrssHUD Package, easy use.

由于MBProgrssHUD在项目中的需求，所以基于MBProgrssHUD再次封装，用起来真特么的爽。



![intro gif](https://github.com/sauchye/SYHUDView/raw/master/intro.gif)



### Base MBProgrssHUD(封装MBProgressHUD，更易用)<br/>

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

```

### Example, easy use:

``` 
    [SYProgressHUD showSuccessText:@"success"];
    
    [SYProgressHUD showLoadingWindowText:@"LoadingWindow"];
    
    [SYProgressHUD showToCenterText:@"CenterText"];
    [SYProgressHUD showToBottomText:@"BottomText"];
    
    [SYProgressHUD showToCustomImage:[UIImage imageNamed:@"nav_back_icon"] text:@"customImage"];
```

And has many not finished...

- welcome to star, fork, pull request or issues.

### Libraries

<a href="https://github.com/jdg/MBProgressHUD">MBProgressHUD</a>