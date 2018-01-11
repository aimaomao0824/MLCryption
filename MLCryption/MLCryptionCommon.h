//
//  MLCryptionCommon.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <CommonCrypto/CommonCryptor.h>


@interface MLCryptionCommon : NSObject
//typedef uint32_t CCMode,CCAlgorithm,CCPadding,CCModeOptions,CCOperation;


enum {
    kMLEncrypt = 0,
    kMLDecrypt,
};
typedef uint32_t MLOperation;

enum {
    kMLAlgorithmAES128 = 0,
    kMLAlgorithmAES = 0,
    kMLAlgorithmDES,
    kMLAlgorithm3DES,
    kMLAlgorithmCAST,
    kMLAlgorithmRC4,
    kMLAlgorithmRC2,
    kMLAlgorithmBlowfish
};
typedef uint32_t MLAlgorithm;


enum {
    /* options for block ciphers */
    kMLOptionPKCS7Padding   = 0x0001,
    kMLOptionECBMode        = 0x0002
    /* stream ciphers currently have no options */
};
typedef uint32_t MLOptions;


enum {
    kMLModeECB		= 1,
    kMLModeCBC		= 2,
    kMLModeCFB		= 3,
    kMLModeCTR		= 4,
    kMLModeF8		= 5, // Unimplemented for now (not included)
    kMLModeLRW		= 6, // Unimplemented for now (not included)
    kMLModeOFB		= 7,
    kMLModeXTS		= 8,
    kMLModeRC4		= 9,
    kMLModeCFB8		= 10,
};
typedef uint32_t MLMode;


enum {
    kMLModeOptionCTR_LE	= 0x0001, // Deprecated in iPhoneOS 6.0 and MacOSX10.9
    kMLModeOptionCTR_BE = 0x0002  // Deprecated in iPhoneOS 6.0 and MacOSX10.9
};

typedef uint32_t MLModeOptions;

enum {
    MLNoPadding			= 0,
    MLPKCS7Padding		= 1,
};
typedef uint32_t MLPadding;


/** MLMode加密的模型如，CBC，ECB等 */
@property (nonatomic, assign) MLMode mode;

/** MLAlgorithm采用什么加密，如AES,DES等 */
@property (nonatomic, assign) MLAlgorithm alg;

/** MLPadding填充方式，如MLPKCS7Padding，等 */
@property (nonatomic, assign) MLPadding padding;

/** iv加密的向量 */
@property (nonatomic, assign) const void *iv;

/** 加密向量的长度ivSize，如kMLBlockSizeAES128，kMLBlockSizeDES 等，多参数方法不用*/
@property (nonatomic, assign) int ivSize;

/** key 密钥*/
@property (nonatomic, copy) NSString *key;

/** 密钥的长度位数MLKeySize，如kMLKeySizeAES128，kMLKeySizeDES等 */
@property (nonatomic, assign) size_t keySize;

/** tweak 密钥*/
@property (nonatomic, copy) NSString *tweak;

/** 密钥的长度位数MLKeySize，如kMLKeySizeAES128，kMLKeySizeDES等 */
@property (nonatomic, assign) size_t tweakSize;

/** numRounds */
@property (nonatomic, assign) int numRounds;


/** MLModeOptions如kMLModeOptionCTR_LE，kMLModeOptionCTR_BE */
@property (nonatomic, assign) MLModeOptions options;



// 设置密钥的长度位数
enum {
    kMLKeySizeAES128          = 16,
    kMLKeySizeAES192          = 24,
    kMLKeySizeAES256          = 32,
    kMLKeySizeDES             = 8,
    kMLKeySize3DES            = 24,
    kMLKeySizeMinCAST         = 5,
    kMLKeySizeMaxCAST         = 16,
    kMLKeySizeMinRC4          = 1,
    kMLKeySizeMaxRC4          = 512,
    kMLKeySizeMinRC2          = 1,
    kMLKeySizeMaxRC2          = 128,
    kMLKeySizeMinBlowfish     = 8,
    kMLKeySizeMaxBlowfish     = 56,
};
typedef size_t MLKeySize;

// 设置iv向量的长度位数
enum {
    /* AES */
    kMLBlockSizeAES128        = 16,
    /* DES */
    kMLBlockSizeDES           = 8,
    /* 3DES */
    kMLBlockSize3DES          = 8,
    /* CAST */
    kMLBlockSizeCAST          = 8,
    kMLBlockSizeRC2           = 8,
    kMLBlockSizeBlowfish      = 8,
};
typedef int MLIvSize;

//设置textSize长度
enum {
    kMLContextSizeAES128	= 404,
    kMLContextSizeDES		= 240,
    kMLContextSize3DES		= 496,
    kMLContextSizeCAST		= 240,
    kMLContextSizeRC4		= 1072
};
typedef int MLTextSize;


//设置iv向量属性
enum {
    ivString	= 0,
    ivByte		= 1,
};
typedef uint32_t ivMode;

/**
 *  封装的一个多参数的通用的加密解密方法
 *
 *  @param textData    传入数据Data
 *  @param op          加密或解密
 *  @param mode        加密模式，如CBC,EBC等
 *  @param alg         加密方式，如AES,DES等
 *  @param padding     填充方式，如MLPKCS7Padding等
 *  @param iv          加密向量
 *  @param key         加密密钥
 *  @param keySize     密钥长度如，kMLKeySizeAES128等
 *  @param tweak       在XTS模式才有，「其它模式默认为NULL就好」
 *  @param tweakLength 在XTS模式才有，密钥长度tweakLength等于keySize「其它模式默认为0就好」
 *  @param numRounds   圆形的数字密码使用，默认为0就好
 *  @param options     仅在大的存储模式支持，如CTR模式。「其它默认为0」
 *  @param cryptor     CCCryptorRef类型
 *
 *  @return 加密或解密后的数据Data
 */
- (NSData *)cryptorAllParasCommonMethodWihtData:(NSData *)textData Operation:(MLOperation)op Mode:(MLMode)mode Algorithm:(MLAlgorithm)alg Padding:(MLPadding)padding iv:(const void *)iv kCCBlockSize:(MLIvSize)kCCBlockSize key:(const void *)key keySize:(MLKeySize)keySize tweak:(const void *)tweak tweakLength:(MLKeySize)tweakLength numRounds:(int)numRounds ModeOptions:(MLModeOptions)options;

- (NSData *)cryptorCommonMethodWihtData:(NSData *)textData MLOperation:(MLOperation)op Algorithm:(MLAlgorithm)alg iv:(const void *)iv key:(const void *)key keySize:(MLKeySize)keySize kCCBlockSize:(MLIvSize)kCCBlockSize;

@end
