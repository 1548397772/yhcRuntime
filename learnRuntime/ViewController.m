//
//  ViewController.m
//  1211212
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "People.h"
#import "People+category.h"
@interface ViewController ()
@property(nonatomic,strong) People *people;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _people= [People new];
    _people.address = @"cxcxcx";
    NSLog(@"%@",_people.address);
    
//    [self huoquchengyuanbianliang];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%@",_people.name);
//    NSLog(@"%@",[_people valueForKeyPath:@"bianliang1"]);
}

- (void)huoquchengyuanbianliang
{
    unsigned int myInt;
    Ivar *bianliangArray = class_copyIvarList([People class], &myInt);
    for (int i = 0; i < myInt; i ++) {
        NSString *bianliangName = [NSString stringWithCString:ivar_getName(bianliangArray[i]) encoding:NSUTF8StringEncoding];
        NSLog(@"%@",bianliangName);
    }
    Ivar nameIvar = class_getInstanceVariable([People class], "_name");
    object_setIvar(_people, nameIvar, @"yhc");
    
    Ivar bianliang1Ivar = class_getInstanceVariable([People class], "bianliang1");
    object_setIvar(_people, bianliang1Ivar, @"woshinidaye");
    
}

- (void)huoquchengyuanshuxing
{
    unsigned int myInt;
    objc_property_t *propertyArray = class_copyPropertyList([People class], &myInt);
    for (int i = 0; i < myInt; i ++) {
        NSString *propertyName = [NSString stringWithCString:property_getName(propertyArray[i]) encoding:NSUTF8StringEncoding];
        NSLog(@"%@",propertyName);
    }
}
@end
