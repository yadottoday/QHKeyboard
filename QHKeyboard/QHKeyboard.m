//
//  QHKeyboard.m
//  QHKeyboard
//
//  Created by 王庆华 on 16/11/24.
//  Copyright © 2016年 王庆华. All rights reserved.
//

#import "QHKeyboard.h"
#import "QHKeyboardNumPad.h"
#import "QHKeyboardWordPad.h"

#define  iPhone4     ([[UIScreen mainScreen] bounds].size.height==480)
#define  iPhone5     ([[UIScreen mainScreen] bounds].size.height==568)
#define  iPhone6     ([[UIScreen mainScreen] bounds].size.height==667)
#define  iPhone6plus ([[UIScreen mainScreen] bounds].size.height==736)


@interface QHKeyboard ()<QHKeyboardNumPadDelegate,QHKeyboardWordPadDelegate>

@property (nonatomic, weak) QHKeyboardNumPad *numPad;
@property (nonatomic, weak) QHKeyboardWordPad *wordPad;

@end

@implementation QHKeyboard

- (instancetype)init {
   
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:116/255.0 green:144/255.0 blue:194/255.0 alpha:0.2];
        CGRect rect = CGRectZero;
        if (iPhone4 || iPhone5) {
            //            rect = CGRectMake(0, 0, 320, 180);
            rect = CGRectMake(0, 0, 320, 216);
        }else if (iPhone6){
            //            rect = CGRectMake(0, 0, 375, 375/320*180);
            rect = CGRectMake(0, 0, 375, 216);
        }else{
            //            rect = CGRectMake(0, 0, 414, 414/320*180);
            rect = CGRectMake(0, 0, 414, 226);
        }
        
        self.frame = rect;
        QHKeyboardNumPad *numPad = [[QHKeyboardNumPad alloc] initWithFrame:rect];
        numPad.delegate = self;
        self.numPad = numPad;
        [self addSubview:numPad];
    }
    return self;
}

- (void)KeyboardNumPadDidClickSwitchBtn:(UIButton *)btn {
    
    if ([btn.titleLabel.text isEqualToString:@"ABC"]) {
        QHKeyboardWordPad *wordPad = [[QHKeyboardWordPad alloc] initWithFrame:self.bounds];
        wordPad.delegate = self;
        [self addSubview:wordPad];
        self.wordPad = wordPad;
        [self.numPad removeFromSuperview];
    }
}

- (void)KeyboardWordPadDidClickSwitchBtn:(UIButton *)btn {
   
    if ([btn.titleLabel.text isEqualToString:@"123"]) {
        
        QHKeyboardNumPad *numPad = [[QHKeyboardNumPad alloc] initWithFrame:self.bounds];
        numPad.delegate = self;
        [self addSubview:numPad];
        self.numPad = numPad;
        [self.wordPad removeFromSuperview];
    }
}

- (void)KeyboardSymbolPadDidClickSwitchBtn:(UIButton *)btn {
    
    if ([btn.titleLabel.text isEqualToString:@"123"]) {
        
        QHKeyboardNumPad *numPad = [[QHKeyboardNumPad alloc] initWithFrame:self.bounds];
        numPad.delegate = self;
        [self addSubview:numPad];
        self.numPad = numPad;
        
    } else {
        
        QHKeyboardWordPad *wordPad = [[QHKeyboardWordPad alloc] initWithFrame:self.bounds];
        wordPad.delegate = self;
        [self addSubview:wordPad];
        self.wordPad = wordPad;
    }
}


@end

