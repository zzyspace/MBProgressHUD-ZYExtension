//
//  MBProgressHUD+ZYExtension.m
//
//  Created by Ryan on 15/8/11.
//

#define MB_Delay 1.5

#import "MBProgressHUD+ZYExtension.h"

@implementation MBProgressHUD (ZYExtension)

#pragma mark - Show Text

+ (void)showText:(NSString *)message
{
    [self showText:message toView:nil];
}

+ (void)showText:(NSString *)message toView:(UIView *)view
{
    [self showText:message toView:view duration:MB_Delay completion:nil];
}

+ (void)showText:(NSString *)message
          toView:(UIView *)view
        duration:(NSTimeInterval)duration
      completion:(void (^)(void))completion
{
    [self show:message icon:nil view:view duration:duration];
    if (completion) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completion();
        });
    }
}

#pragma mark - Show Success

+ (void)showSuccess:(NSString *)message
{
    [self showSuccess:message toView:nil];
}

+ (void)showSuccess:(NSString *)message toView:(UIView *)view
{
    [self showSuccess:message toView:view duration:MB_Delay completion:nil];
}

+ (void)showSuccess:(NSString *)message
             toView:(UIView *)view
           duration:(NSTimeInterval)duration
         completion:(void (^)(void))completion
{
    [self show:message icon:[UIImage imageNamed:@"MBProgressHUD-ZYExtension.bundle/hud_success.png"] view:view duration:duration];
    if (completion) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completion();
        });
    }
}

#pragma mark - Show Error

+ (void)showError:(NSString *)message
{
    [self showError:message toView:nil];
}

+ (void)showError:(NSString *)message toView:(UIView *)view
{
    [self showError:message toView:view duration:MB_Delay completion:nil];
}

+ (void)showError:(NSString *)message
           toView:(UIView *)view
         duration:(NSTimeInterval)duration
       completion:(void (^)(void))completion
{
    [self show:message icon:[UIImage imageNamed:@"MBProgressHUD-ZYExtension.bundle/hud_error.png"] view:view duration:duration];
    if (completion) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completion();
        });
    }
}

#pragma mark - Waiting

+ (MBProgressHUD *)showWaiting
{
    return [self showWaiting:nil toView:nil];
}

+ (MBProgressHUD *)showWaiting:(NSString *)message toView:(UIView *)view
{
    [self hideHUDForView:view];
    return [self showMessage:message toView:view];
}

#pragma mark - Progress

+ (MBProgressHUD *)showProgress:(NSString *)message {
    [self hideHUDForView:nil];
    return [self showProgress:message toView:nil];
}

#pragma mark - Common

+ (void)show:(NSString *)text icon:(UIImage *)icon view:(UIView *)view duration:(NSTimeInterval)duration
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // 设置文字
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:icon];
    
    // 设置模式
    hud.mode = MBProgressHUDModeCustomView;

    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // duration秒之后再消失
    [hud hideAnimated:YES afterDelay:duration];
}

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // 设置文字
    hud.label.text = message;
    hud.label.numberOfLines = 0;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    return hud;
}

+ (MBProgressHUD *)showProgress:(NSString *)message toView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // 设置文字
    hud.label.text = message;
    
    // 设置模式
    hud.mode = MBProgressHUDModeDeterminate;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    return hud;
}


+ (void)hideHUD
{
    [self zy_hideHUDForView:nil animated:YES];
}

+ (void)hideHUD:(BOOL)animated
{
    [self zy_hideHUDForView:nil animated:animated];
}

+ (void)hideHUDForView:(UIView *)view
{
    [self zy_hideHUDForView:view animated:YES];
}

+ (void)zy_hideHUDForView:(UIView *)view animated:(BOOL)animated
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:animated];
}

@end
