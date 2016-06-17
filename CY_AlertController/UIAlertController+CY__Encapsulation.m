//
//  UIAlertController+CY__Encapsulation.m
//  CY_AlertController
//
//  Created by GuoBin on 16/6/16.
//  Copyright © 2016年 GuoBin. All rights reserved.
//

#import "UIAlertController+CY__Encapsulation.h"

@implementation UIAlertController (CY__Encapsulation)


#pragma mark - 一个只有取消按钮的alert
+ (nonnull instancetype)AlertWithTitle:(nullable NSString *)title
                               message:(nullable NSString *)message
                           cancelTitle:(nullable NSString *)cancelButtonTitle
                       completionBlock:(nullable UIAlertControllerCompletionBlock)tapBlock {
    
    return [self AlertWithTitle:title
                        message:message
                    cancelTitle:cancelButtonTitle
               destructiveTitle:nil
                completionBlock:tapBlock
                    otherTitles:nil];
}

#pragma mark - 一个只有取消按钮的ActionSheet
+ (nonnull instancetype)ActionSheetWithTitle:(nullable NSString *)title
                                     message:(nullable NSString *)message
                                 cancelTitle:(nullable NSString *)cancelButtonTitle
                             completionBlock:(nullable UIAlertControllerCompletionBlock)tapBlock {
    return [self ActionSheetWithTitle:title message:message
                          cancelTitle:cancelButtonTitle
                     destructiveTitle:nil
                      completionBlock:tapBlock
                          otherTitles:nil];
}

#pragma mark - 有destructive,cancel,other按钮的alert
+ (nonnull instancetype)AlertWithTitle:(nullable NSString *)title
                               message:(nullable NSString *)message
                           cancelTitle:(nullable NSString *)cancelButtonTitle
                      destructiveTitle:(nullable NSString *)destructiveButtonTitle
                       completionBlock:(nullable UIAlertControllerCompletionBlock)tapBlock
                           otherTitles:(nullable NSString *)otherButtonTitles, ... {
    
    if (!cancelButtonTitle && !otherButtonTitles && !destructiveButtonTitle) {
        return nil;
    }
    
    NSInteger buttonIndex = 0;
    
    UIAlertController *strongController = [self alertControllerWithTitle:title
                                                                 message:message
                                                          preferredStyle:UIAlertControllerStyleAlert];
    
    __weak UIAlertController *controller = strongController;
    
    if (cancelButtonTitle) {
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action){
                                                                 if (tapBlock) {
                                                                     tapBlock(action, buttonIndex);
                                                                 }
                                                             }];
        [controller addAction:cancelAction];
    }
    
    if (destructiveButtonTitle) {
        ++buttonIndex;
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle
                                                                    style:UIAlertActionStyleDestructive
                                                                  handler:^(UIAlertAction *action){
                                                                      if (tapBlock) {
                                                                          tapBlock(action, buttonIndex);
                                                                      }
                                                                  }];
        [controller addAction:destructiveAction];
        
    }
    
    void (^createOtherBlock)(NSString *,NSInteger) = ^(NSString *otherTitle,NSInteger index) {
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherTitle
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action){
                                                                if (tapBlock) {
                                                                    tapBlock(action, index);
                                                                }
                                                            }];
        [controller addAction:otherAction];
    };
    
    if (otherButtonTitles != nil) {
        id eachObject;
        va_list argumentList;
        if (otherButtonTitles) {
            createOtherBlock(otherButtonTitles,++buttonIndex);
            
            va_start(argumentList, otherButtonTitles);
            while ((eachObject = va_arg(argumentList, id))) {
                
                createOtherBlock(eachObject,++buttonIndex);
            }
            va_end(argumentList);
        }
    }
    
    return controller;
}

#pragma mark - 有destructive,cancel,other按钮的Sheet
+ (nonnull instancetype)ActionSheetWithTitle:(nullable NSString *)title
                                     message:(nullable NSString *)message
                                 cancelTitle:(nullable NSString *)cancelButtonTitle
                            destructiveTitle:(nullable NSString *)destructiveButtonTitle
                             completionBlock:(nullable UIAlertControllerCompletionBlock)tapBlock
                                 otherTitles:(nullable NSString *)otherButtonTitles, ... {
    if (!cancelButtonTitle && !otherButtonTitles && !destructiveButtonTitle) {
        return nil;
    }
    
    NSInteger buttonIndex = 0;
    
    UIAlertController *strongController = [self alertControllerWithTitle:title
                                                                 message:message
                                                          preferredStyle:UIAlertControllerStyleActionSheet];
    
    __weak UIAlertController *controller = strongController;
    
    if (cancelButtonTitle) {
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action){
                                                                 if (tapBlock) {
                                                                     tapBlock(action, buttonIndex);
                                                                 }
                                                             }];
        [controller addAction:cancelAction];
    }
    
    if (destructiveButtonTitle) {
        ++buttonIndex;
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle
                                                                    style:UIAlertActionStyleDestructive
                                                                  handler:^(UIAlertAction *action){
                                                                      if (tapBlock) {
                                                                          tapBlock(action, buttonIndex);
                                                                      }
                                                                  }];
        [controller addAction:destructiveAction];
        
    }
    
    void (^createOtherBlock)(NSString *,NSInteger) = ^(NSString *otherTitle,NSInteger index) {
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherTitle
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action){
                                                                if (tapBlock) {
                                                                    tapBlock(action, index);
                                                                }
                                                            }];
        [controller addAction:otherAction];
    };
    
    if (otherButtonTitles != nil) {
        id eachObject;
        va_list argumentList;
        if (otherButtonTitles) {
            createOtherBlock(otherButtonTitles,++buttonIndex);
            
            va_start(argumentList, otherButtonTitles);
            while ((eachObject = va_arg(argumentList, id))) {
                
                createOtherBlock(eachObject,++buttonIndex);
            }
            va_end(argumentList);
        }
    }
    
    return controller;
}

@end
