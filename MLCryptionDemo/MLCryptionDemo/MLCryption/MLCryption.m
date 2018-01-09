//
//  MLCryption.m
//  MLCryptionDemo
//
//  Created by mtapple on 2018/1/5.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryption.h"

@interface MLCryption()


@end

@implementation MLCryption
//
//# pragma mark - 创建DES加密器
//CCCryptorRef cryptor = NULL;
//+ (instancetype)cryptionDES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *) iv ivMode:(ivMode)ivMode
//{
//    return [[MLCryption alloc] initWithDES_Mode:MLMode MLPadding:MLPadding key:key iv:iv  ivMode:ivMode];
//}
//
//- (instancetype)initWithDES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
//{
//    if (self = [super init]) {
//        self.MLMode = MLMode;
//        self.MLPadding = MLPadding;
//        self.key = key;
//        if (ivMode == ivString) {
//            self.iv = (const void *)[(__bridge NSString *)iv UTF8String];
//        }else{
//            self.iv = iv;
//        }
//    }
//    return self;
//}
//
//# pragma mark - DES加密和解密
///** 输入一个Data数据，返回一个加密后的Data数据 */
//- (NSData *)ml_encryptUseDes_DataToData:(NSData *)plainData;
//{
//    
//    //1.创建加密器CCCryptorRef
//    CCCryptorStatus cryptorStatus = CCCryptorCreateWithMode(kCCEncrypt, self.MLMode, kCCAlgorithmDES, kCCOptionPKCS7Padding, self.iv, [self.key UTF8String], kCCKeySizeDES, NULL, 0, 0, 0, &cryptor);
//    if (cryptorStatus!=kCCSuccess) return nil;
//    
//    size_t bufsize = 0;
//    size_t moved = 0;
//    size_t total = 0;
//    
//    //2.获取输出数据的最大长度
////    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *textData = plainData;
//    bufsize = CCCryptorGetOutputLength(cryptor, textData.length, true);
//    char * buf = (char*)malloc(bufsize);
//    bzero(buf, bufsize);
//    
//    //3.加密处理
//    cryptorStatus = CCCryptorUpdate(cryptor, textData.bytes, textData.length, buf, bufsize, &moved);
//    total += moved;
//    if (cryptorStatus!=kCCSuccess) return nil;
//    
//    //4.处理最后的数据块
//    cryptorStatus = CCCryptorFinal(cryptor, buf + total, bufsize - total, &moved);
//    if (cryptorStatus!=kCCSuccess) return nil;
//    total += moved;
//    
//    //5.释放
//    CCCryptorRelease(cryptor);
//    NSData * retData = [NSData dataWithBytes:buf length:total];
//    free(buf);
////    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
//    
//    return retData;
//}
//
///** 输入一个加密Data数据，返回一个解密后的Data数据 */
//- (NSData *)ml_decryptUseDes_DataToData:(NSData *)cipherData
//{
//    //1.创建加密器CCCryptorRef
//    CCCryptorStatus cryptorStatus = CCCryptorCreateWithMode(kCCDecrypt, self.MLMode, kCCAlgorithmDES, kCCOptionPKCS7Padding, self.iv, [self.key UTF8String], kCCKeySizeDES, NULL, 0, 0, 0, &cryptor);
//    if (cryptorStatus!=kCCSuccess) return nil;
//    
//    size_t bufsize = 0;
//    size_t moved = 0;
//    size_t total = 0;
//    
//    //2.获取输出数据的最大长度
////    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
//    NSData *textData = cipherData;
//    bufsize = CCCryptorGetOutputLength(cryptor, textData.length, true);
//    char * buf = (char*)malloc(bufsize);
//    bzero(buf, bufsize);
//    
//    //3.加密处理
//    cryptorStatus = CCCryptorUpdate(cryptor, textData.bytes, textData.length, buf, bufsize, &moved);
//    total += moved;
//    if (cryptorStatus!=kCCSuccess) return nil;
//    
//    //4.处理最后的数据块
//    cryptorStatus = CCCryptorFinal(cryptor, buf + total, bufsize - total, &moved);
//    if (cryptorStatus!=kCCSuccess) return nil;
//    total += moved;
//    
//    //5.释放
//    CCCryptorRelease(cryptor);
//    NSData * retData = [NSData dataWithBytes:buf length:total];
//    free(buf);
////    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
//    return retData;
//}
//
///** 输入一个NSString数据，返回一个加密后的NSString数据 */
//- (NSString *)ml_encryptUseDes_StrToStr:(NSString *)plainText
//{
//    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
//   NSData *retData = [self ml_encryptUseDes_DataToData:textData];
//    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
//
//    return ciphertext;
//}
//
///** 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
//- (NSString *)ml_decryptUseDes_StrToStr:(NSString *)cipherText
//{
//    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
//    NSData *retData = [self ml_decryptUseDes_DataToData:textData];
//    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
//    return plainText;
//}

@end

