//
//  Instance.h
//  12_21
//
//  Created by renren-mac on 2017/12/21.
//  Copyright © 2017年 renren-mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Instance : NSObject
//单例传值
@property(nonatomic,strong)NSString*            str;
+(instancetype)sharedInstace;
@end
