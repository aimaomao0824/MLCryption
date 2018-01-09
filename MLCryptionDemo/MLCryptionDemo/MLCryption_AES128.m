//
//  MLCryption_AES128.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/8.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryption_AES128.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation MLCryption_AES128


# pragma mark - 创建AES128加密器
CCCryptorRef cryptorAES128 = NULL;

+ (instancetype)cryptionAES128_key:(NSString *)key iv:(const void *) iv ivMode:(ivMode)ivMode
{
    return [[MLCryption_AES128 alloc] initWithAES128_key:key iv:iv  ivMode:ivMode];
}

- (instancetype)initWithAES128_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
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

# pragma mark - AES128加密和解密
/**AES128 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptUseAES128_DataToData:(NSData *)plainData;
{
    return [self cryptorCommonMethodWihtData:plainData MLOperation:kMLEncrypt Algorithm:kMLAlgorithmAES128 iv:self.iv key:[self.key UTF8String]  keySize:kMLKeySizeAES128 kCCBlockSize:kCCBlockSizeAES128];
}

/**AES128 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptUseAES128_DataToData:(NSData *)cipherData
{
    return [self cryptorCommonMethodWihtData:cipherData MLOperation:kMLDecrypt Algorithm:kMLAlgorithmAES128 iv:self.iv key:[self.key UTF8String]  keySize:kMLKeySizeAES128 kCCBlockSize:kCCBlockSizeAES128];
}


/**AES128 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptUseAES128_StrToStr:(NSString *)plainText
{
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *retData = [self ml_encryptUseAES128_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return ciphertext;
}

/**AES128 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptUseAES128_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptUseAES128_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return plainText;
}

@end
