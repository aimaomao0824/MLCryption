//
//  ViewController.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/2.
//  Copyright © 2018年 作者MannersLee. All rights reserved.
//

#import "ViewController.h"
#import "MLCryption.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testBase64_String];
    
    
}

-(void)testBase64_String
{
//    NSString *str = @"MannersLee";
    NSString *str = @"中华人民共和国";
    NSData *data = [[NSString alloc] initWithString:str];
    NSLog(@"%@",data);
    //类方法
//    NSString *crypStr = [NSString ml_encodeStringUseBase64:str];
//    NSString *deCrypStr = [NSString ml_encodeStringUseBase64:crypStr];
    //对象方法
    NSString *crypStr = [str ml_encodeStringUseBase64];
    NSString *deCrypStr = [crypStr ml_decodeStringUseBase64];
    
//    NSLog(@"Base64-->>原文：%@，加密后：%@,解密后：%@",str,crypStr,deCrypStr);
    
//    NSData *crypStrData = [data ml_encodeDataUseBase64];
//    NSData *deCrypStrData = [crypStrData ml_decodeDataUseBase64];
//    NSLog(@"Base64-->>原文：%@，加密后：%@,解密后：%@",data,crypStrData,deCrypStrData);
    
}

-(void)testDES
{
//    NSString *str = @"MannersLee";
    NSString *str = @"中华人民共和国";
    NSString *key = @"123456789012345678901234";
    const Byte iv[] = {1,2,3,4,5,6,7,8};
    //    NSString *crypStr = [NSString ml_encryptUseDes:str key:key iv: iv];
    NSString *crypStr = [str ml_encryptUseDesKey:key iv:iv];
    NSString *deCrypStr = [crypStr ml_decryptUseDesKey:key iv:iv];
    //    NSString *deCrypStr = [NSString ml_decryptUseDes:crypStr key:key iv:iv];
    NSLog(@"DES-->>原文：%@，key：%@，iv：%s，加密后：%@,解密后：%@",str,key,iv,crypStr,deCrypStr);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
