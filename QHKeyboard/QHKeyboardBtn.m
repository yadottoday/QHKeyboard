//
//  QHKeyboardBtn.m
//  QHKeyboard
//
//  Created by 王庆华 on 16/11/24.
//  Copyright © 2016年 王庆华. All rights reserved.
//

#import "QHKeyboardBtn.h"

@implementation QHKeyboardBtn

+ (QHKeyboardBtn *)buttonWithTitle:(NSString *)title tag:(NSInteger)tag delegate:(id)delegate
{
    QHKeyboardBtn *btn = [QHKeyboardBtn buttonWithType:UIButtonTypeCustom];
    btn.tag = tag;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:btn action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [btn setBackgroundImage:[UIImage imageNamed:@"images.bundle/keypadBtn"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"images.bundle/keypadBtnHighLighted"] forState:UIControlStateHighlighted];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    btn.delegate = delegate;
    
    return btn;
}

- (void)btnClick:(QHKeyboardBtn *)btn {
    
    if ([self.delegate respondsToSelector:@selector(KeyboardBtnDidClick:)]) {
        [self.delegate KeyboardBtnDidClick:btn];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
