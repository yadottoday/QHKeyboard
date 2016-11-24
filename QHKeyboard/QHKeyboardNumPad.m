//
//  QHKeyboardNumPad.m
//  QHKeyboard
//
//  Created by 王庆华 on 16/11/24.
//  Copyright © 2016年 王庆华. All rights reserved.
//

#import "QHKeyboardNumPad.h"

@interface QHKeyboardNumPad () <QHKeyboardBtnDelegate>

@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, weak) UITextField *responder;

@end

@implementation QHKeyboardNumPad

- (UITextField *)responder{
    //    if (!_responder) {  // 防止多个输入框采用同一个inputview
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstResponder = [keyWindow valueForKey:@"firstResponder"];
    _responder = (UITextField *)firstResponder;
    //    }
    return _responder;
}

- (instancetype)initWithFrame:(CGRect)frame{
   
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addControl];
    }
    return self;
}

- (void)addControl {
   
    NSMutableArray *btnArray = [NSMutableArray array];
    QHKeyboardBtn *btn1 = [QHKeyboardBtn buttonWithTitle:@"1" tag:0 delegate:self];
    [self addSubview:btn1];
    
    QHKeyboardBtn *btn2 = [QHKeyboardBtn buttonWithTitle:@"2" tag:1 delegate:self];
    [self addSubview:btn2];
    
    QHKeyboardBtn *btn3 = [QHKeyboardBtn buttonWithTitle:@"3" tag:2 delegate:self];
    [self addSubview:btn3];
    
    QHKeyboardBtn *btn4 = [QHKeyboardBtn buttonWithTitle:@"4" tag:4 delegate:self];
    [self addSubview:btn4];
    
    QHKeyboardBtn *btn5 = [QHKeyboardBtn buttonWithTitle:@"5" tag:5 delegate:self];
    [self addSubview:btn5];
    
    QHKeyboardBtn *btn6 = [QHKeyboardBtn buttonWithTitle:@"6" tag:6 delegate:self];
    [self addSubview:btn6];
    
    QHKeyboardBtn *btn7 = [QHKeyboardBtn buttonWithTitle:@"7" tag:8 delegate:self];
    [self addSubview:btn7];
    
    QHKeyboardBtn *btn8 = [QHKeyboardBtn buttonWithTitle:@"8" tag:9 delegate:self];
    [self addSubview:btn8];
    
    QHKeyboardBtn *btn9 = [QHKeyboardBtn buttonWithTitle:@"9" tag:10 delegate:self];
    [self addSubview:btn9];
    
    QHKeyboardBtn *btn0 = [QHKeyboardBtn buttonWithTitle:@"0" tag:13 delegate:self];
    [self addSubview:btn0];
    
    QHKeyboardBtn *btnAT = [QHKeyboardBtn buttonWithTitle:@"" tag:12 delegate:self];
    [self addSubview:btnAT];
    
    QHKeyboardBtn *pointBtn = [QHKeyboardBtn buttonWithTitle:@"." tag:14 delegate:self];
    [self addSubview:pointBtn];
    
    UIButton *wordSwitchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    wordSwitchBtn.tag = 12;
    [wordSwitchBtn addTarget:self action:@selector(switchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [wordSwitchBtn setTitle:@"ABC" forState:UIControlStateNormal];
    wordSwitchBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [wordSwitchBtn setBackgroundImage:[UIImage imageNamed:@"images.bundle/keypadLongBtn"] forState:UIControlStateNormal];
    [self addSubview:wordSwitchBtn];
    
    UIButton *symbolSwitchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [symbolSwitchBtn setBackgroundImage:[UIImage imageNamed:@"images.bundle/keypadLongBtn"] forState:UIControlStateNormal];
    [symbolSwitchBtn setTitle:@"" forState:UIControlStateNormal];
    [symbolSwitchBtn addTarget:self action:@selector(switchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    symbolSwitchBtn.titleLabel.font = wordSwitchBtn.titleLabel.font;
    symbolSwitchBtn.tag = 7;
    [self addSubview:symbolSwitchBtn];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setImage:[UIImage imageNamed:@"images.bundle/keypadDeleteBtn"] forState:UIControlStateNormal];
    [self addSubview:deleteBtn];
    deleteBtn.tag = 7;
    
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [okBtn setTitle:@"完成" forState:UIControlStateNormal];
    [okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:okBtn];

    [okBtn setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:11/255.0 green:98/255.0 blue:224/255.0 alpha:1]] forState:UIControlStateNormal];
    [okBtn setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:11/255.0 green:98/255.0 blue:224/255.0 alpha:1]] forState:UIControlStateHighlighted];
    okBtn.tag = 15;
    
    [wordSwitchBtn addTarget:self action:@selector(switchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [symbolSwitchBtn addTarget:self action:@selector(switchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [deleteBtn addTarget:self action:@selector(deleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.btnArray = btnArray;
    [self.btnArray addObject:btn1];
    [self.btnArray addObject:btn2];
    [self.btnArray addObject:btn3];
    [self.btnArray addObject:btn4];
    [self.btnArray addObject:btn5];
    [self.btnArray addObject:btn6];
    [self.btnArray addObject:btn7];
    [self.btnArray addObject:btn8];
    [self.btnArray addObject:btn9];
    [self.btnArray addObject:btn0];
    [self.btnArray addObject:btnAT];
    [self.btnArray addObject:pointBtn];
    [self.btnArray addObject:deleteBtn];
    [self.btnArray addObject:symbolSwitchBtn];
    [self.btnArray addObject:wordSwitchBtn];
    [self.btnArray addObject:okBtn];
    
    for (int i = 11; i<16; i++) {
       
        UIButton *btn = self.btnArray[i];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGFloat btnW = (self.frame.size.width - 5*margin)/4;
    CGFloat btnH = (self.frame.size.height - 5*margin)/4;
    
    for (QHKeyboardBtn *btn in self.btnArray) {
        if (btn.tag == 7) {
            
            // 删除键
            btn.frame = CGRectMake(margin + 3 % 4 * (btnW + margin), margin, btnW, btnH*2 + margin);
        }  else if (btn.tag == 15) {
            // 确定键
            btn.frame = CGRectMake(margin + 11 % 4 * (btnW + margin), margin + 11 / 4 * (btnH + margin), btnW, btnH*2 + margin);
        } else {
            btn.frame = CGRectMake(margin + btn.tag % 4 * (btnW + margin), margin + btn.tag / 4 * (btnH + margin), btnW, btnH);
        }
    }
}

- (void)switchBtnClick:(UIButton *)btn {
    
    if ([self.delegate respondsToSelector:@selector(KeyboardNumPadDidClickSwitchBtn:)]) {
        [self.delegate KeyboardNumPadDidClickSwitchBtn:btn];
    }
}

- (void)deleteBtnClick {
    
    if (self.responder.text.length) {
        self.responder.text = [self.responder.text substringToIndex:self.responder.text.length-1];
    }
}

- (void)okBtnClick{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

#pragma mark - QHKeyboardBtnDelegate
-(void)KeyboardBtnDidClick:(QHKeyboardBtn *)btn{
    
    if (btn.tag % 4 == 3) {
        return;
    }
    self.responder.text = [self.responder.text stringByAppendingString:btn.titleLabel.text];
}
/**
 *  用颜色返回一张图片
 */
- (UIImage *)createImageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end

