//
//  QHKeyboardNumPad.h
//  QHKeyboard
//
//  Created by 王庆华 on 16/11/24.
//  Copyright © 2016年 王庆华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QHKeyboardBtn.h"

@protocol QHKeyboardNumPadDelegate  <NSObject>

@required
- (void)KeyboardNumPadDidClickSwitchBtn:(UIButton *)btn;

@end

@interface QHKeyboardNumPad : UIView <QHKeyboardBtnDelegate>

@property (nonatomic, assign) id <QHKeyboardNumPadDelegate> delegate;

@end
