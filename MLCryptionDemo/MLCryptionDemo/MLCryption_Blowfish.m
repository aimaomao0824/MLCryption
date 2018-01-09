//
//  MLCryption_Blowfish.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/9.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryption_Blowfish.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation MLCryption_Blowfish
# pragma mark - 创建Blowfish加密器
CCCryptorRef cryptorBlowfish = NULL;

+ (instancetype)cryptionBlowfish_key:(NSString *)key iv:(const void *) iv ivMode:(ivMode)ivMode
{
    return [[MLCryption_Blowfish alloc] initWithBlowfish_key:key iv:iv  ivMode:ivMode];
}

- (instancetype)initWithBlowfish_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
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

# pragma mark - Blowfish加密和解密
/**Blowfish 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptUseBlowfish_DataToData:(NSData *)plainData;
{
    return [self cryptorCommonMethodWihtData:plainData MLOperation:kCCEncrypt Algorithm:kCCAlgorithmBlowfish iv:self.iv key:[self.key UTF8String]  keySize:kMLKeySizeMaxBlowfish kCCBlockSize:kCCBlockSizeBlowfish];
}

/**Blowfish 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptUseBlowfish_DataToData:(NSData *)cipherData
{
    return [self cryptorCommonMethodWihtData:cipherData MLOperation:kCCDecrypt Algorithm:kCCAlgorithmBlowfish iv:self.iv key:[self.key UTF8String]  keySize:kMLKeySizeMaxBlowfish kCCBlockSize:kCCBlockSizeBlowfish];
}


/**Blowfish 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptUseBlowfish_StrToStr:(NSString *)plainText
{
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *retData = [self ml_encryptUseBlowfish_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return ciphertext;
}

/**Blowfish 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptUseBlowfish_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptUseBlowfish_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return plainText;
}

@end
