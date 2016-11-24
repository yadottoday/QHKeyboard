//
//  QHKeyboardBtn.h
//  QHKeyboard
//
//  Created by 王庆华 on 16/11/24.
//  Copyright © 2016年 王庆华. All rights reserved.
//

#import <UIKit/UIKit.h>

#define margin 5

@class QHKeyboardBtn;
@protocol QHKeyboardBtnDelegate <NSObject>

@required
- (void)KeyboardBtnDidClick:(QHKeyboardBtn *)btn;

@end

@interface QHKeyboardBtn : UIButton

+ (QHKeyboardBtn *)buttonWithTitle:(NSString *)title tag:(NSInteger)tag  delegate:(id)delegate;

@property (nonatomic, assign) id <QHKeyboardBtnDelegate> delegate;

@end
