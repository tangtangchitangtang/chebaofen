//
//  Toast.m
//  Toast
//
//  Created by 李立 on 16/6/22.
//  Copyright © 2016年 李立. All rights reserved.
//

#import "Toast.h"

#define IS_PRINT_LOG  (0)
#define Log(string) if(IS_PRINT_LOG){NSLog(string);}

@interface Toast()
@property (strong , nonatomic) NSTimer *timer;

@end

@implementation Toast

+ (instancetype)toast
{
    return [[[self class] alloc] init];
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.windowLevel = UIWindowLevelAlert+100;
        
        CGSize size = [UIScreen mainScreen].bounds.size;
        self.center = CGPointMake(size.width/2.0f, size.height-60);
        CGRect bounds = self.bounds;
        bounds.size = CGSizeMake(200, 50);
        self.bounds = bounds;
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 8;
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hideToast:) userInfo:nil repeats:NO];
    }
    
    return self;
}

- (void)makeText:(NSString *)text
{
    UILabel *msgLabel = [[UILabel alloc] initWithFrame:self.bounds];
    msgLabel.font = [UIFont systemFontOfSize:16.0f];
    msgLabel.textAlignment = NSTextAlignmentCenter;
    msgLabel.textColor = [UIColor whiteColor];
    msgLabel.numberOfLines = 0; //可换行
    msgLabel.text = text;
    msgLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:msgLabel];
    
    [UIView animateWithDuration:.2 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        [self makeKeyAndVisible];
    }];
}

- (void)resignToast
{
    [UIView animateWithDuration:.2 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    } completion:^(BOOL finished) {
        [self resignKeyWindow];
    }];
}

- (void)hideToast:(NSTimer *)sender
{
    [self resignToast];
    [sender invalidate];
}

- (void)dealloc
{
    Log(@"Toast销毁");
}


@end





