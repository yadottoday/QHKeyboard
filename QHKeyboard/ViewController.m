//
//  ViewController.m
//  QHKeyboard
//
//  Created by 王庆华 on 16/11/24.
//  Copyright © 2016年 王庆华. All rights reserved.
//

#import "ViewController.h"
#import "QHKeyboard.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *testTF;

@end

@implementation ViewController

- (UITextField *)testTF {
    
    if (!_testTF) {
        _testTF = [[UITextField alloc] init];
    }
    return _testTF;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(70, 100, [UIScreen mainScreen].bounds.size.width - 140, 30);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:25];
    titleLabel.textColor = [UIColor redColor];
    titleLabel.text = @"自定义键盘";
    [self.view addSubview:titleLabel];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(70, 150, [UIScreen mainScreen].bounds.size.width - 140, 40)];
    [textField setTintColor:[UIColor redColor]];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.placeholder = @"这是一个输入框";
    self.testTF = textField;
    [self.view addSubview:textField];
    textField.inputView = [[QHKeyboard alloc] init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan: touches withEvent:event];
    [self.testTF resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
