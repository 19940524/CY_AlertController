//
//  ViewController.m
//  CY_AlertController
//
//  Created by GuoBin on 16/6/16.
//  Copyright © 2016年 GuoBin. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertController+CY__Encapsulation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnaction:(id)sender {
    
    UIAlertController *alert = [UIAlertController AlertWithTitle:@"充实"
                                                         message:@"消息"
                                                     cancelTitle:@"取消"
                                                destructiveTitle:@"destructive"
                                                 completionBlock:^(UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                     NSLog(@"buttonIndex = %ld",(long)buttonIndex);
                                                 }
                                                     otherTitles:@"1",@"2",nil];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
