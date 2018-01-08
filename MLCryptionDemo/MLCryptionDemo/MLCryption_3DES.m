//
//  MLCryption_3DES.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/8.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryption_3DES.h"
#import <CommonCrypto/CommonCryptor.h>


@implementation MLCryption_3DES

# pragma mark - 创建3DES加密器
CCCryptorRef cryptor3DES = NULL;

+ (instancetype)cryption3DES_key:(NSString *)key iv:(const void *) iv ivMode:(ivMode)ivMode
{
    return [[MLCryption_3DES alloc] initWith3DES_key:key iv:iv  ivMode:ivMode];
}

- (instancetype)initWith3DES_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
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

# pragma mark - 3DES加密和解密
/**3DES 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptUse3DES_DataToData:(NSData *)plainData;
{
    return [self cryptorCommonMethodWihtData:plainData MLOperation:kMLEncrypt Algorithm:kMLAlgorithm3DES iv:self.iv key:[self.key UTF8String]  keySize:kMLKeySize3DES kCCBlockSize:kCCBlockSize3DES];
}

/**3DES 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptUse3DES_DataToData:(NSData *)cipherData
{
    return [self cryptorCommonMethodWihtData:cipherData MLOperation:kMLDecrypt Algorithm:kMLAlgorithm3DES iv:self.iv key:[self.key UTF8String]  keySize:kMLKeySize3DES kCCBlockSize:kCCBlockSize3DES];
}


/**3DES 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptUse3DES_StrToStr:(NSString *)plainText
{
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *retData = [self ml_encryptUse3DES_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return ciphertext;
}

/**3DES 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptUse3DES_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptUse3DES_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return plainText;
}

@end
