//
//  ISASettingViewController.m
//  ISALibrary
//
//  Created by Arclin on 16/3/8.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import "ISASettingViewController.h"

@interface ISASettingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@end

@implementation ISASettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 从沙盒中取出数据
    self.numLabel.text = [self loadFromUserDefault];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"设置条数" message:@"请输入每页显示的条数" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.placeholder =  @"显示条数";
    }];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"好了" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // 点击按钮后调用
        NSString *num = alert.textFields.firstObject.text;
        if ([num integerValue] <= 1) {
            num = @"1";
        }
        self.numLabel.text = num;
        [self saveToUserDefault:num];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

// 保存到沙盒
- (void)saveToUserDefault:(NSString *)str
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:str forKey:@"Num"];
    [defaults synchronize];
    
}

// 从沙盒取出
- (NSString *)loadFromUserDefault
{
    NSString *str = [[NSString alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        str = [defaults objectForKey:@"Num"];
    }
    return str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
