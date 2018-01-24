//
//  Instance.m
//  12_21
//
//  Created by renren-mac on 2017/12/21.
//  Copyright © 2017年 renren-mac. All rights reserved.
//

#import "Instance.h"

@implementation Instance
//实现单例
+(instancetype)sharedInstace
{
    static Instance *shared=nil;
    if(shared==nil)
    {
        shared=[[Instance alloc]init];
    }
    return shared;
}
@end
