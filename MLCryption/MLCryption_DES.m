//
//  MLCryption_DES.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryption_DES.h"
#import <CommonCrypto/CommonCryptor.h>


@implementation MLCryption_DES

# pragma mark - 创建DES加密器
CCCryptorRef cryptorDES = NULL;

+ (instancetype)cryptionDES_key:(NSString *)key iv:(const void *) iv ivMode:(ivMode)ivMode
{
    return [[MLCryption_DES alloc] initWithDES_key:key iv:iv  ivMode:ivMode];
}

- (instancetype)initWithDES_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
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

# pragma mark - DES加密和解密
/**3DES 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptUseDes_DataToData:(NSData *)plainData;
{
  return [self cryptorCommonMethodWihtData:plainData MLOperation:kMLEncrypt Algorithm:kMLAlgorithmDES iv:self.iv key:[self.key UTF8String]  keySize:kMLKeySizeDES kCCBlockSize:kCCBlockSizeDES];
}

/**3DES 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptUseDes_DataToData:(NSData *)cipherData
{
    return [self cryptorCommonMethodWihtData:cipherData MLOperation:kMLDecrypt Algorithm:kMLAlgorithmDES iv:self.iv key:[self.key UTF8String]  keySize:kMLKeySizeDES kCCBlockSize:kCCBlockSizeDES];
}


/**3DES 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptUseDes_StrToStr:(NSString *)plainText
{
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *retData = [self ml_encryptUseDes_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return ciphertext;
}

/**3DES 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptUseDes_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptUseDes_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return plainText;
}

@end
