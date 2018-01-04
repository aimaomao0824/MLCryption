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
//    [self testBase64_String];
    [self testBase64_Data];
    
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

/** 将字符串编码测试 */
-(void)testBase64_String
{
//        NSString *str = @"MannersLee";
    NSString *str = @"中华人民共和国万岁！";
    //类方法
//        NSString *crypStr = [NSString ml_encodeStringUseBase64:str];
//        NSString *deCrypStr = [NSString ml_decodeStringUseBase64:crypStr];
    //对象方法
//    NSString *crypStr = [str ml_encodeStringUseBase64];
//    NSString *deCrypStr = [crypStr ml_decodeStringUseBase64];
    
//        NSLog(@"Base64-->>原文：%@，加密后：%@,解密后：%@",str,crypStr,deCrypStr);
    //类方法
//        NSData *crypStrData = [NSString ml_encodeDataUseBase64:str];//编码
//        NSString *deCrypStrString = [NSData ml_decodeStringUseBase64:crypStrData];//解码
    //对象方法
//        NSData *crypStrData = [str ml_encodeDataUseBase64];
//        NSString *deCrypStrString = [crypStrData ml_decodeStringUseBase64];
//        NSLog(@"Base64-->>原文：%@，加密后：%@,解密后：%@",str,crypStrData,deCrypStrString);
    
     NSString *crypStr = [NSString ml_encodeStringUseBase64:str];//加密后的String
    
//     NSData *data = [NSString ml_decodeDataUseBase64:crypStr];
     NSData *data = [crypStr ml_decodeDataUseBase64];
     NSString *deCrypStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
     NSLog(@"Base64-->>原文：%@，加密后：%@,解密后：%@,解密后的String：%@",str,crypStr,data,deCrypStr);
}

/** 将NSData编码测试 */
- (void)testBase64_Data
{
    // 获取需要加密文件的二进制数据
//    NSData *data = [NSData dataWithContentsOfFile:@"/Users/mtapple/Desktop/icon_long_task.png"];
//    
//    // 或 base64EncodedStringWithOptions
////    NSData *base64Data = [data base64EncodedDataWithOptions:0];
////    NSData *cryData = [data ml_encodeDataUseBase64];
//    NSData *cryData = [NSData ml_encodeDataUseBase64:data];
//    
//    // 将加密后的文件存储到桌面
//    [cryData writeToFile:@"/Users/mtapple/Desktop/220.jpg" atomically:YES];
//    
//    // 获得加密后的二进制数据
//    NSData *cryData2 = [NSData dataWithContentsOfFile:@"/Users/mtapple/Desktop/220.jpg"];
//    // 解密 base64 数据
////    NSData *baseDataDE = [NSData ml_decodeDataUseBase64:cryData];
//     NSData *baseDataDE = [cryData2 ml_decodeDataUseBase64];
//    //
//    //    // 写入桌面
//    [baseDataDE writeToFile:@"/Users/mtapple/Desktop/解密图片33.jpg" atomically:YES];
    
    
    NSString *str = @"中华人民共和国万岁！";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    //    NSString *cryStr = [NSData ml_encodeStringUseBase64:data];
        NSString *cryStr = [data ml_encodeStringUseBase64];
    
    NSString *decStr = [cryStr ml_decodeStringUseBase64];
    NSLog(@"Base64-->>原文：%@，加密后：%@,解密后：%@,data：%@",str,cryStr,decStr,data);
    
}

@end
