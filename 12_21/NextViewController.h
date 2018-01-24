//
//  NextViewController.h
//  12_21
//
//  Created by renren-mac on 2017/12/21.
//  Copyright © 2017年 renren-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PassValueDelegate

-(void)PassValue:(NSString*)str;

@end


@interface NextViewController : UIViewController
@property(nonatomic,strong)NSString*                str;
@property(nonatomic,weak)id<PassValueDelegate>     delegate;
@property(copy) void (^block)(NSString *);
@end
