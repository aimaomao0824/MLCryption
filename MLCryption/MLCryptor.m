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

# pragma mark - CBC模式公共加密器初始化
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
+ (instancetype)cryptorCommonMethodCBC_PK7WithAlgorithm:(CCAlgorithm)alg key:(NSString *)key keySize:(MLKeySize)keySize iv:(const void *)iv ivMode:(ivMode)ivMode  ivSize:(MLIvSize)ivSize
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

# pragma mark - 多参数模式公共加密器初始化
+ (instancetype)cryptorCommonMethodWithMode:(CCMode)mode Algorithm:(CCAlgorithm)alg Padding:(CCPadding)padding iv:(const void *)iv ivSize:(MLIvSize)ivSize ivMode:(ivMode)ivMode key:(NSString *)key keySize:(MLKeySize)keySize tweak:(NSString *)tweak tweakSize:(MLKeySize)tweakLength numRounds:(int)numRounds ModeOptions:(CCModeOptions)options;
{
    return [[MLCryptor alloc] initCommonMethodWithMode:mode Algorithm:alg Padding:padding iv:iv  ivSize:(MLIvSize)ivSize ivMode:ivMode key:key keySize:keySize tweak:tweak tweakSize:tweakLength numRounds:numRounds ModeOptions:options];
}

/**
 *  多参数模式加密器初始化
 *
 *  @param mode        加密模式，如CBC,EBC等
 *  @param alg         加密方式，如AES,DES等
 *  @param padding     填充方式，如ccPKCS7Padding等
 *  @param iv          加密向量
 *  @param ivMode    向量传入模式「NSStirng 或者 Byte」
 *  @param key         加密密钥
 *  @param keySize     密钥长度如，kMLKeySizeAES128等
 *  @param tweak       在XTS模式才有，「其它模式默认为NULL就好」
 *  @param tweakSize 在XTS模式才有，密钥长度tweakLength等于keySize「其它模式默认为0就好」
 *  @param numRounds   圆形的数字密码使用，默认为0就好
 *  @param options     仅在大的存储模式支持，如CTR模式。「其它默认为0」
 *  @param cryptor     CCCryptorRef类型
 *
 *  @return 返回加密器
 */
- (instancetype)initCommonMethodWithMode:(CCMode)mode Algorithm:(CCAlgorithm)alg Padding:(CCPadding)padding iv:(const void *)iv ivSize:(MLIvSize)ivSize ivMode:(ivMode)ivMode key:(NSString *)key keySize:(MLKeySize)keySize tweak:(NSString *)tweak tweakSize:(MLKeySize)tweakSize numRounds:(int)numRounds ModeOptions:(CCModeOptions)options;
{
    if (self = [super init]) {
        self.isSampleCryptor = NO;
        self.mode = mode;
        self.alg = alg;
        self.padding = padding;
        if (ivMode == ivString) {
            self.iv = (const void *)[(__bridge NSString *)iv UTF8String];
        }else{
            self.iv = iv;
        }
        self.ivSize = ivSize;
        self.key = key;
        self.keySize = keySize;
        if (self.mode == kCCModeXTS) {
            self.tweak = tweak;
            self.tweakSize = tweakSize;
        }else{
            self.tweak = NULL;
            self.tweakSize = 0;
        }
        if (self.numRounds >= 0) {
            self.numRounds = numRounds;
        }else{
            self.numRounds = 0;
        }
        if (self.mode == kCCModeCTR) {
            self.options = options;
        }else{
            self.options = 0;
        }
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
        return [self cryptorAllParasCommonMethodWihtData:plainData Operation:kCCEncrypt Mode:self.mode Algorithm:self.alg Padding:self.padding iv:self.iv kCCBlockSize:self.ivSize key:[self.key UTF8String]keySize:self.keySize tweak:[self.tweak UTF8String] tweakLength:self.tweakSize numRounds:self.numRounds ModeOptions:self.options];
    }
}

/**解密方法-> 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptCommonMethod_DataToData:(NSData *)cipherData
{
    if (self.isSampleCryptor) {
        return [self cryptorCommonMethodWihtData:cipherData MLOperation:kCCDecrypt Algorithm:self.alg iv:self.iv key:[self.key UTF8String]  keySize:self.keySize kCCBlockSize:self.ivSize];
    }else{
        return [self cryptorAllParasCommonMethodWihtData:cipherData Operation:kCCDecrypt Mode:self.mode Algorithm:self.alg Padding:self.padding iv:self.iv kCCBlockSize:self.ivSize key:[self.key UTF8String]keySize:self.keySize tweak:[self.tweak UTF8String] tweakLength:self.tweakSize numRounds:self.numRounds ModeOptions:self.options];
    }
}


/**加密方法-> 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptCommonMethod_StrToStr:(NSString *)plainText
{
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *retData = [self ml_encryptCommonMethod_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return ciphertext;
}

/**解密方法-> 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptCommonMethod_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptCommonMethod_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    
    return plainText;
}

@end
