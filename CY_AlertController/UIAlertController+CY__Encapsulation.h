//
//  UIAlertController+CY__Encapsulation.h
//  CY_AlertController
//
//  Created by GuoBin on 16/6/16.
//  Copyright © 2016年 GuoBin. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - 使用备注
/**
 *  buttonIndex : cancel = 0,destructive = 1,other 在其前两位加一  多位other逐加
 *  使用例一:
 *  UIAlertController *alert = [UIAlertController AlertWithTitle:@"充实"
 *                                                       message:@"消息"
 *                                                   cancelTitle:@"取消"
 *                                              destructiveTitle:@"destructive"
 *                                               completionBlock:^(UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
 *                                                  NSLog(@"buttonIndex = %ld",(long)buttonIndex);
 *                                              }
 *                                                   otherTitles:@"1",@"2",nil];
 *
 *  [self presentViewController:alert animated:YES completion:nil];
 
 * -----------------------------------------------------------------------------------------------------------
 
 *  使用例二: 可以让回调block放在外边初始化,代码更易读   PS:建议使用
 
 *  void (^block) (UIAlertAction *, NSInteger) = ^(UIAlertAction * action, NSInteger buttonIndex) {
 *      NSLog(@"buttonIndex = %ld",(long)buttonIndex);
 *  };
 
 *  UIAlertController *alert = [UIAlertController AlertWithTitle:@"充实"
 *                                                       message:@"消息"
 *                                                   cancelTitle:@"取消"
 *                                              destructiveTitle:@"destructive"
 *                                               completionBlock:block
 *                                                   otherTitles:@"1",@"2",nil];
 
 *  [self presentViewController:alert animated:YES completion:nil];
 
 * ActionSheet一样的使用方法 :)
 */

/**
 *  回调
 *
 *  @param action      UIAlertAction 实例
 *  @param buttonIndex buttonIndex 索引
 */
typedef void (^UIAlertControllerCompletionBlock) (UIAlertAction * __nonnull action, NSInteger buttonIndex);

@interface UIAlertController (CY__Encapsulation)

/**
 *  一个只有取消按钮的alert
 *
 *  @param title             标题
 *  @param message           副标题
 *  @param cancelButtonTitle 取消按钮名称
 *  @param tapBlock          回调
 *
 *  @return UIAlertController 实例
 */
+ (nonnull instancetype)AlertWithTitle:(nullable NSString *)title
                               message:(nullable NSString *)message
                           cancelTitle:(nullable NSString *)cancelButtonTitle
                       completionBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;

/**
 *  有destructive,cancel,other按钮的alert
 *
 *  @param title             标题
 *  @param message           副标题
 *  @param cancelButtonTitle 取消按钮名称
 *  @param destructiveTitle  destructive 红色title
 *  @param tapBlock          回调
 *  @param otherButtonTitles 可以多个other按钮,逗号隔开,nil结尾. 如 --->  otherTitles:@"1",@"2",@"3",nil
 *
 *  @return UIAlertController 实例
 */
+ (nonnull instancetype)AlertWithTitle:(nullable NSString *)title
                               message:(nullable NSString *)message
                           cancelTitle:(nullable NSString *)cancelButtonTitle
                      destructiveTitle:(nullable NSString *)destructiveButtonTitle
                       completionBlock:(nullable UIAlertControllerCompletionBlock)tapBlock
                           otherTitles:(nullable NSString *)otherButtonTitles, ...;

/**
 *  一个只有取消按钮的ActionSheet
 *
 *  @param title             标题
 *  @param message           副标题
 *  @param cancelButtonTitle 取消按钮名称
 *  @param tapBlock          回调
 *
 *  @return UIAlertController 实例
 */
+ (nonnull instancetype)ActionSheetWithTitle:(nullable NSString *)title
                                     message:(nullable NSString *)message
                                 cancelTitle:(nullable NSString *)cancelButtonTitle
                             completionBlock:(nullable UIAlertControllerCompletionBlock)tapBlock;


/**
 *  有destructive,cancel,other按钮的Sheet
 *
 *  @param title             标题
 *  @param message           副标题
 *  @param cancelButtonTitle 取消按钮名称
 *  @param destructiveTitle  destructive 红色title
 *  @param tapBlock          回调
 *  @param otherButtonTitles 可以多个other按钮,逗号隔开,nil结尾. 如 --->  otherTitles:@"1",@"2",@"3",nil
 *
 *  @return UIAlertController 实例
 */
+ (nonnull instancetype)ActionSheetWithTitle:(nullable NSString *)title
                                     message:(nullable NSString *)message
                                 cancelTitle:(nullable NSString *)cancelButtonTitle
                            destructiveTitle:(nullable NSString *)destructiveButtonTitle
                             completionBlock:(nullable UIAlertControllerCompletionBlock)tapBlock
                                 otherTitles:(nullable NSString *)otherButtonTitles, ...;

@end
