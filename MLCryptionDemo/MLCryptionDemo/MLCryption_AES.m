//
//  MLCryption_AES.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryption_AES.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation MLCryption_AES

# pragma mark - 创建AES加密器
CCCryptorRef cryptorAES = NULL;
+ (instancetype)cryptionAES_key:(NSString *)key iv:(const void *) iv ivMode:(ivMode)ivMode
{
    return [[MLCryption_AES alloc] initWithAES_key:key iv:iv  ivMode:ivMode];
}

- (instancetype)initWithAES_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
{
    if (self = [super init]) {
        self.key = key;
        if (ivMode == ivString) {
            self.iv = (const void *)[(__bridge NSString *)iv UTF8String];
        }else{
            self.iv = iv;
        }
    }
    return self;
}

# pragma mark - AES加密和解密
/** 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptUseAES_DataToData:(NSData *)plainData;
{
    
    //1.创建加密器CCCryptorRef
    CCCryptorStatus cryptorStatus = CCCryptorCreateWithMode(kCCEncrypt, self.MLMode, kCCAlgorithmAES, kCCOptionPKCS7Padding, self.iv, [self.key UTF8String], kCCKeySizeAES128, NULL, 0, 0, 0, &cryptorAES);
    if (cryptorStatus!=kCCSuccess) return nil;
    
    size_t bufsize = 0;
    size_t moved = 0;
    size_t total = 0;
    
    //2.获取输出数据的最大长度
    //    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *textData = plainData;
    bufsize = CCCryptorGetOutputLength(cryptorAES, textData.length, true);
    char * buf = (char*)malloc(bufsize);
    bzero(buf, bufsize);
    
    //3.加密处理
    cryptorStatus = CCCryptorUpdate(cryptorAES, textData.bytes, textData.length, buf, bufsize, &moved);
    total += moved;
    if (cryptorStatus!=kCCSuccess) return nil;
    
    //4.处理最后的数据块
    cryptorStatus = CCCryptorFinal(cryptorAES, buf + total, bufsize - total, &moved);
    if (cryptorStatus!=kCCSuccess) return nil;
    total += moved;
    
    //5.释放
    CCCryptorRelease(cryptorAES);
    NSData * retData = [NSData dataWithBytes:buf length:total];
    free(buf);
    //    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return retData;
}

/** 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptUseAES_DataToData:(NSData *)cipherData
{
    //1.创建加密器CCCryptorRef
    CCCryptorStatus cryptorStatus = CCCryptorCreateWithMode(kCCDecrypt, self.MLMode, kCCAlgorithmAES, kCCOptionPKCS7Padding, self.iv, [self.key UTF8String], kCCKeySizeAES128, NULL, 0, 0, 0, &cryptorAES);
    if (cryptorStatus!=kCCSuccess) return nil;
    
    size_t bufsize = 0;
    size_t moved = 0;
    size_t total = 0;
    
    //2.获取输出数据的最大长度
    //    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *textData = cipherData;
    bufsize = CCCryptorGetOutputLength(cryptorAES, textData.length, true);
    char * buf = (char*)malloc(bufsize);
    bzero(buf, bufsize);
    
    //3.加密处理
    cryptorStatus = CCCryptorUpdate(cryptorAES, textData.bytes, textData.length, buf, bufsize, &moved);
    total += moved;
    if (cryptorStatus!=kCCSuccess) return nil;
    
    //4.处理最后的数据块
    cryptorStatus = CCCryptorFinal(cryptorAES, buf + total, bufsize - total, &moved);
    if (cryptorStatus!=kCCSuccess) return nil;
    total += moved;
    
    //5.释放
    CCCryptorRelease(cryptorAES);
    NSData * retData = [NSData dataWithBytes:buf length:total];
    free(buf);
    //    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return retData;
}

/** 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptUseAES_StrToStr:(NSString *)plainText
{
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *retData = [self ml_encryptUseAES_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return ciphertext;
}

/** 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptUseAES_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptUseAES_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return plainText;
}

@end
