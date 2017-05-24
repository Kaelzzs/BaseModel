//
//  ZSBaseModelViewController.m
//  ZSBaseModel
//
//  Created by zzsat on 05/22/2017.
//  Copyright (c) 2017 zzsat. All rights reserved.
//

#import "ZSBaseModelViewController.h"

#import "ZSBaseModel.h"


@interface ZSBaseModelViewController ()

@end

@implementation ZSBaseModelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    //功能1：给未赋值的NSString属性添加一个默认字符串 以免UI上出现NULL nil
    NSLog(@"功能1：给NSString属性添加默认字符串测试\n");
    ZSBaseModel *zb = [[ZSBaseModel alloc] init];
    zb.name = @"kael";
    zb.age = @"18";
    NSLog(@"设置默认字符之前------------\n姓名:%@--年龄:%@--性别:%@",zb.name,zb.age,zb.sex);
        [zb zs_resetIvarValueWithDefaultString:@"哥们儿是空"];//给继承ZSBaseModel的子类对象修改默认值
    [ZSBaseModel zs_resetIvarValueWithObject:zb andDefaultString:@"逗比"];//给某一对象的某一个属性设置默认参数
    NSLog(@"设置默认字符之后------------\n姓名:%@--年龄:%@--性别:%@",zb.name,zb.age,zb.sex);
    
    
    //功能2：替换某各类的类方法（+方法）、实例化方法（-方法）
    NSLog(@"功能2测试:\n");
    NSLog(@"修改之前的方法日志:\n");
    [zb logDog];
   
    //替换类方法交换
    [ZSBaseModel replaceMethodWithInstanceOfClass:[zb class] newSelector:@selector(logCat) oldSelector:@selector(logDog)];
    /*
     实例化方法交换
     +(void)replaceMethodWithInstanceOfClass:(Class)cls newSelector:(SEL)newSelector oldSelector:(SEL)oldSelector;
     */
    NSLog(@"修改之后的方法日志:\n");
    [zb logDog];//方法替换（交换）后同一个对象的方法替换成功


    
    ZSBaseModel *zb2 = [[ZSBaseModel alloc] init];
    zb.name = @"kael";
    zb.age = @"18";
    NSLog(@"修改之后该类创建的其他对象 调用的这个方法也会被替换掉:\n");
    [zb2 logDog];//其他
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
