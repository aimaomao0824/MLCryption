//
//  MLCryption_RC2.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/9.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryption_RC2.h"
#import <CommonCrypto/CommonCryptor.h>


@implementation MLCryption_RC2

# pragma mark - 创建RC2加密器
CCCryptorRef cryptorRC2 = NULL;

+ (instancetype)cryptionRC2_key:(NSString *)key iv:(const void *) iv ivMode:(ivMode)ivMode
{
    return [[MLCryption_RC2 alloc] initWithRC2_key:key iv:iv  ivMode:ivMode];
}

- (instancetype)initWithRC2_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
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

# pragma mark - RC2加密和解密
/**RC2 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptUseRC2_DataToData:(NSData *)plainData;
{
    return [self cryptorCommonMethodWihtData:plainData MLOperation:kMLEncrypt Algorithm:kMLAlgorithmRC2 iv:self.iv key:[self.key UTF8String]  keySize:kMLKeySizeMaxRC2 kCCBlockSize:kCCBlockSizeRC2];
}

/**RC2 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptUseRC2_DataToData:(NSData *)cipherData
{
    return [self cryptorCommonMethodWihtData:cipherData MLOperation:kMLDecrypt Algorithm:kMLAlgorithmRC2 iv:self.iv key:[self.key UTF8String]  keySize:kMLKeySizeMaxRC2 kCCBlockSize:kCCBlockSizeRC2];
}


/**RC2 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptUseRC2_StrToStr:(NSString *)plainText
{
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *retData = [self ml_encryptUseRC2_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return ciphertext;
}

/**RC2 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptUseRC2_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptUseRC2_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return plainText;
}

@end
