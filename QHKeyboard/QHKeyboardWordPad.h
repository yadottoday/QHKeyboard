//
//  QHKeyboardWordPad.h
//  QHKeyboard
//
//  Created by 王庆华 on 16/11/24.
//  Copyright © 2016年 王庆华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QHKeyboardBtn.h"

@protocol QHKeyboardWordPadDelegate <NSObject>

@required
- (void)KeyboardWordPadDidClickSwitchBtn:(UIButton *)btn;

@end

@interface QHKeyboardWordPad : UIView <QHKeyboardBtnDelegate>

@property (nonatomic, assign) id <QHKeyboardWordPadDelegate> delegate;

@end

