//
//  MLCryptor.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryptor.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation MLCryptor


# pragma mark - 公共加密方法
/*!
 @function   CCCryptorCreateWithMode
 @abstract   Create a cryptographic context.
 
 @param      op         Defines the basic operation: kCCEncrypt or
 kCCDecrypt.
 
 @param     mode		Specifies the cipher mode to use for operations.
 
 @param      alg        Defines the algorithm.
 
 @param		padding		Specifies the padding to use.
 
 @param      iv         Initialization vector, optional. Used by
 block ciphers with the following modes:
 
 Cipher Block Chaining (CBC)
 Cipher Feedback (CFB and CFB8)
 Output Feedback (OFB)
 Counter (CTR)
 
 If present, must be the same length as the selected
 algorithm's block size.  If no IV is present, a NULL
 (all zeroes) IV will be used.
 
 This parameter is ignored if ECB mode is used or
 if a stream cipher algorithm is selected.
 
 @param      key         Raw key material, length keyLength bytes.
 
 @param      keyLength   Length of key material. Must be appropriate
 for the selected operation and algorithm. Some
 algorithms  provide for varying key lengths.
 
 @param      tweak      Raw key material, length keyLength bytes. Used for the
 tweak key in XEX-based Tweaked CodeBook (XTS) mode.
 
 @param      tweakLength   Length of tweak key material. Must be appropriate
 for the selected operation and algorithm. Some
 algorithms  provide for varying key lengths.  For XTS
 this is the same length as the encryption key.
 
 @param		numRounds	The number of rounds of the cipher to use.  0 uses the default.
 
 @param      options    A word of flags defining options. 请看CCModeOptions类型.
 
 @param      cryptorRef  返回一个指针「必须的」 CCCryptorRef.
 
 @result     可能错误后返回 kCCParamError 和 kCCMemoryFailure.
 */
CCCryptorRef cryptor = NULL;
- (NSData *)cryptorCommonMethodWihtData:(NSData *)textData MLOperation:(MLOperation)op MLMode:(MLMode)mode Algorithm:(MLAlgorithm)alg Padding:(CCOptions)padding iv:(const void *)iv key:(const void *)key keySize:(int)keySize tweak:(const void *)tweak tweakLength:(size_t)tweakLength numRounds:(int)numRounds CCModeOptions:(CCModeOptions)options
{
    //1.创建加密器CCCryptorRef
    CCCryptorStatus cryptorStatus = CCCryptorCreateWithMode(op, mode, alg, padding, iv, key, keySize, tweak, tweakLength, numRounds, options, &cryptor);
    if (cryptorStatus!=kCCSuccess) return nil;
    
    size_t bufsize = 0;
    size_t moved = 0;
    size_t total = 0;
    
    //2.获取输出数据的最大长度
    bufsize = CCCryptorGetOutputLength(cryptor, textData.length, true);
    char * buf = (char*)malloc(bufsize);
    bzero(buf, bufsize);
    
    //3.加密处理
    cryptorStatus = CCCryptorUpdate(cryptor, textData.bytes, textData.length, buf, bufsize, &moved);
    total += moved;
    if (cryptorStatus!=kCCSuccess) return nil;
    
    //4.处理最后的数据块
    cryptorStatus = CCCryptorFinal(cryptor, buf + total, bufsize - total, &moved);
    if (cryptorStatus!=kCCSuccess) return nil;
    total += moved;
    
    //5.释放
    CCCryptorRelease(cryptor);
    NSData * retData = [NSData dataWithBytes:buf length:total];
    free(buf);
    
    return retData;
}



# pragma mark - 创建DES加密器
+ (instancetype)cryption_DES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *) iv ivMode:(ivMode)ivMode
{
    return [[MLCryptor alloc] initWith_DES_Mode:MLMode MLPadding:MLPadding key:key iv:iv  ivMode:ivMode];
}

- (instancetype)initWith_DES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
{
    if (self = [super init]) {
        self.MLMode = MLMode;
        self.MLPadding = MLPadding;
        self.key = key;
        if (ivMode == ivString) {
            self.iv = (const void *)[(__bridge NSString *)iv UTF8String];
        }else{
            self.iv = iv;
        }
    }
    return self;
}

# pragma mark - 创建3DES加密器
+ (instancetype)cryption_3DES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
{
    return [[MLCryptor alloc] initWith_3DES_Mode:MLMode MLPadding:MLPadding key:key iv:iv  ivMode:ivMode];
}
- (instancetype)initWith_3DES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
{
    if (self = [super init]) {
        self.MLMode = MLMode;
        self.MLPadding = MLPadding;
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
/** 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptUseDes_DataToData:(NSData *)plainData
{
  return   [self cryptorCommonMethodWihtData:plainData MLOperation:kCCEncrypt MLMode:self.MLMode Algorithm:kCCAlgorithmDES Padding:kCCOptionPKCS7Padding iv:self.iv key:[self.key UTF8String]  keySize:kCCKeySizeDES tweak:NULL tweakLength:0 numRounds:0 CCModeOptions:0];
}


/** 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptUseDes_DataToData:(NSData *)cipherData
{
    return [self cryptorCommonMethodWihtData:cipherData MLOperation:kCCDecrypt MLMode:self.MLMode Algorithm:kCCAlgorithmDES Padding:kCCOptionPKCS7Padding iv:self.iv key:[self.key UTF8String] keySize:kCCKeySizeDES tweak:NULL tweakLength:0 numRounds:0 CCModeOptions:0];
}

/** 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptUseDes_StrToStr:(NSString *)plainText
{
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
   NSData *retData = [self ml_encryptUseDes_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];

    return ciphertext;
}

/** 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptUseDes_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptUseDes_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return plainText;
}


# pragma mark - 3DES加密和解密
/**3DES 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptUse3Des_DataToData:(NSData *)plainData
{
    return   [self cryptorCommonMethodWihtData:plainData MLOperation:kCCEncrypt MLMode:self.MLMode Algorithm:kCCAlgorithm3DES Padding:kCCOptionPKCS7Padding iv:self.iv key:[self.key UTF8String]  keySize:kCCKeySize3DES tweak:NULL tweakLength:0 numRounds:0 CCModeOptions:0];
}


/**3DES 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptUse3Des_DataToData:(NSData *)cipherData
{
    return [self cryptorCommonMethodWihtData:cipherData MLOperation:kCCDecrypt MLMode:self.MLMode Algorithm:kCCAlgorithm3DES Padding:kCCOptionPKCS7Padding iv:self.iv key:[self.key UTF8String] keySize:kCCKeySize3DES tweak:NULL tweakLength:0 numRounds:0 CCModeOptions:0];
}

/**3DES 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptUse3Des_StrToStr:(NSString *)plainText
{
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *retData = [self ml_encryptUse3Des_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return ciphertext;
}

/**3DES 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptUse3Des_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptUse3Des_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return plainText;
}

# pragma mark - AES加密
// 创建AES加密器
+ (instancetype)cryption_AES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding KeySize:(MLKeySize)keySize key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
{
    return [[MLCryptor alloc] initWith_AES_Mode:MLMode MLPadding:MLPadding KeySize:keySize key:key iv:iv ivMode:ivMode];

}

- (instancetype)initWith_AES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding KeySize:(MLKeySize)keySize key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
{
    if (self = [super init]) {
        self.MLMode = MLMode;
        self.MLPadding = MLPadding;
        self.keySize = keySize;
        self.key = key;
        if (ivMode == ivString) {
            self.iv = (const void *)[(__bridge NSString *)iv UTF8String];
        }else{
            self.iv = iv;
        }
    }
    return self;
}

/**AES 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUseAES_StrToStr:(NSString *)plainText
{
    
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *retData = [self ml_encryptUseAES_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return ciphertext;
    
}
- (NSString *)ml_decryptUseAES_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptUseAES_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return plainText;
}
/**AES 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUseAES_DataToData:(NSData *)plainData
{
    return   [self cryptorCommonMethodWihtData:plainData MLOperation:kCCEncrypt MLMode:self.MLMode Algorithm:kCCAlgorithmAES Padding:kCCOptionPKCS7Padding iv:self.iv key:[self.key UTF8String]  keySize:self.keySize tweak:NULL tweakLength:0 numRounds:0 CCModeOptions:0];
}
- (NSData *)ml_decryptUseAES_DataToData:(NSData *)cipherData
{
    return [self cryptorCommonMethodWihtData:cipherData MLOperation:kCCDecrypt MLMode:self.MLMode Algorithm:kCCAlgorithmAES Padding:kCCOptionPKCS7Padding iv:self.iv key:[self.key UTF8String]  keySize:self.keySize tweak:NULL tweakLength:0 numRounds:0 CCModeOptions:0];
}


# pragma mark - CAST加密解密方法
// 创建CAST加密器
+ (instancetype)cryption_CAST_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding KeySize:(MLKeySize)keySize key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
{
    return [[MLCryptor alloc] initWith_CAST_Mode:MLMode MLPadding:MLPadding KeySize:keySize key:key iv:iv ivMode:ivMode];
}
- (instancetype)initWith_CAST_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding KeySize:(MLKeySize)keySize key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode
{
    if (self = [super init]) {
        self.MLMode = MLMode;
        self.MLPadding = MLPadding;
        self.keySize = keySize;
        self.key = key;
        if (ivMode == ivString) {
            self.iv = (const void *)[(__bridge NSString *)iv UTF8String];
        }else{
            self.iv = iv;
        }
    }
    return self;
}

/**CAST 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptUseCAST_StrToStr:(NSString *)plainText
{
    
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData *retData = [self ml_encryptUseCAST_DataToData:textData];
    NSString *ciphertext = [retData base64EncodedStringWithOptions:0];
    
    return ciphertext;
}
/**CAST 输入一个NSString数据，返回一个解密后的NSString数据 */

- (NSString *)ml_decryptUseCAST_StrToStr:(NSString *)cipherText
{
    NSData *textData = [[NSData alloc]initWithBase64EncodedString:cipherText options:0];
    NSData *retData = [self ml_decryptUseCAST_DataToData:textData];
    NSString *plainText =[[NSString alloc]initWithData:retData encoding:NSUTF8StringEncoding];
    return plainText;

}
/**CAST 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptUseCAST_DataToData:(NSData *)plainData
{
    return   [self cryptorCommonMethodWihtData:plainData MLOperation:kCCEncrypt MLMode:self.MLMode Algorithm:kCCAlgorithmCAST Padding:kCCOptionPKCS7Padding iv:self.iv key:[self.key UTF8String]  keySize:self.keySize tweak:NULL tweakLength:0 numRounds:0 CCModeOptions:0];
}
/**CAST 输入一个NSString数据，返回一个解密后的NSString数据 */
- (NSData *)ml_decryptUseCAST_DataToData:(NSData *)cipherData
{
    return [self cryptorCommonMethodWihtData:cipherData MLOperation:kCCDecrypt MLMode:self.MLMode Algorithm:kCCAlgorithmCAST Padding:kCCOptionPKCS7Padding iv:self.iv key:[self.key UTF8String]  keySize:self.keySize tweak:NULL tweakLength:0 numRounds:0 CCModeOptions:0];
}


@end
