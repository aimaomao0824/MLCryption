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

- (void)testBase64_Data
{
    // 获取需要加密文件的二进制数据
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/wangpengfei/Desktop/photo/IMG_5551.jpg"];
    
    // 或 base64EncodedStringWithOptions
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    
    // 将加密后的文件存储到桌面
    [base64Data writeToFile:@"/Users/wangpengfei/Desktop/123" atomically:YES];
    
//    // 获得加密后的二进制数据
//    NSData *base64Data = [NSData dataWithContentsOfFile:@"/Users/wangpengfei/Desktop/123"];
//    
//    // 解密 base64 数据
//    NSData *baseData = [[NSData alloc] initWithBase64EncodedData:base64Data options:0];
//    
//    // 写入桌面
//    [baseData writeToFile:@"/Users/wangpengfei/Desktop/IMG_5551.jpg" atomically:YES];
    
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
