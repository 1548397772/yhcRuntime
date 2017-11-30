//
//  People+category.m
//  1211212
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//
#import <objc/runtime.h>
#import "People+category.h"
static const char *addressKey = "addressKey";
@implementation People (category)

- (void)setAddress:(NSString *)address
{
    objc_setAssociatedObject(self, addressKey, address, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)address
{
    return objc_getAssociatedObject(self, addressKey);
}


@end
