//
//  MLCryptor.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryptor.h"
#import <CommonCrypto/CommonCryptor.h>

@interface MLCryptor()

/** 是否采用多参数加密 */
@property (nonatomic, assign) BOOL isSampleCryptor;

@end

@implementation MLCryptor

# pragma mark - 公共加密方法创建
CCCryptorRef cryptor = NULL;
/**
 *  这个模式下初始化的加密器参数默认为->CBC模式/pkcs7padding填充/Base64输出/utf8编码,
 *
 *  @param alg     加密方式
 *  @param key     加密密钥
 *  @param keySize 密钥长度设置
 *  @param iv      向量设置
 *  @param ivMode  向量传入模式「NSStirng 或者 Byte」
 *  @param ivSize  向量长度设置
 *
 *  @return 返回一个初始化后的加密器cryptor
 */
+ (instancetype)cryptorCommonMethodCBC_PK7WithAlgorithm:(CCAlgorithm)alg key:(NSString *)key keySize:(MLKeySize)keySize iv:(const void *) iv ivMode:(ivMode)ivMode  ivSize:(MLIvSize)ivSize
{
    return [[MLCryptor alloc] initCommonMethodCBC_PK7WithAlgorithm:alg key:key keySize:keySize iv:iv ivMode:ivMode ivSize:ivSize];
}
/**
 *  这个模式下初始化的加密器参数默认为->CBC模式/pkcs7padding填充/Base64输出/utf8编码,
 *
 *  @param alg     加密方式
 *  @param key     加密密钥
 *  @param keySize 密钥长度设置
 *  @param iv      向量设置
 *  @param ivMode  向量传入模式「NSStirng 或者 Byte」
 *  @param ivSize  向量长度设置
 *
 *  @return 返回一个初始化后的加密器cryptor
 */
- (instancetype)initCommonMethodCBC_PK7WithAlgorithm:(CCAlgorithm)alg key:(NSString *)key keySize:(MLKeySize)keySize iv:(const void *)iv ivMode:(ivMode)ivMode  ivSize:(MLIvSize)ivSize
{
    if (self = [super init]) {
        self.isSampleCryptor = YES;
        self.alg = alg;
        self.key = key;
        self.keySize = keySize;
        if (ivMode == ivString) {
            self.iv = (const void *)[(__bridge NSString *)iv UTF8String];
        }else{
            self.iv = iv;
        }
        self.ivSize = ivSize;
    }
    return self;
}

# pragma mark - 公共加密和解密方法
/**加密方法->「输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptCommonMethod_DataToData:(NSData *)plainData
{
    if (self.isSampleCryptor) {
        return [self cryptorCommonMethodWihtData:plainData MLOperation:kCCEncrypt Algorithm:self.alg iv:self.iv key:[self.key UTF8String]  keySize:self.keySize kCCBlockSize:self.ivSize];
    }else{
        return nil;
    }
}

/**解密方法-> 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptCommonMethod_DataToData:(NSData *)cipherData
{
    if (self.isSampleCryptor) {
        return [self cryptorCommonMethodWihtData:cipherData MLOperation:kCCDecrypt Algorithm:self.alg iv:self.iv key:[self.key UTF8String]  keySize:self.keySize kCCBlockSize:self.ivSize];
    }else{
        return nil;
    }
}


/**加密方法-> 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptCommonMethod_StrToStr:(NSString *)plainText
{
    if (self.isSampleCryptor) {
        NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
        NSData *retData = [self ml_encryptCommonMethod_DataToData:textData];
        NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
        
        return ciphertext;
    }else{
        return nil;
    }
}

/**解密方法-> 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptCommonMethod_StrToStr:(NSString *)cipherText
{
    if (self.isSampleCryptor) {
        NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
        NSData *retData = [self ml_decryptCommonMethod_DataToData:textData];
        NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
        
        return plainText;
    }else{
        return nil;
    }
}




@end
