//
//  MLCryptionCommon.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>


@interface MLCryptionCommon : NSObject


/** MLMode */
@property (nonatomic, assign) CCAlgorithm alg;

/** MLMode */
@property (nonatomic, assign) uint32_t MLMode;

/** MLPadding */
@property (nonatomic, assign) CCPadding MLPadding;

/** key */
@property (nonatomic, copy) NSString *key;

/** 密钥的长度位数MLKeySize */
@property (nonatomic, assign) int keySize;

/** iv */
@property (nonatomic, assign) const void *iv;

/** 加密向量的长度ivSize */
@property (nonatomic, assign) int ivSize;


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
typedef int MLKeySize;

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


//- (NSData *)test_cryptorCommonMethodWihtData:(NSData *)textData Operation:(CCOperation)op Mode:(CCMode)mode Algorithm:(CCAlgorithm)alg Padding:(CCPadding)padding iv:(const void *)iv key:(const void *)key keySize:(int)keySize tweak:(const void *)tweak tweakLength:(size_t)tweakLength numRounds:(int)numRounds ModeOptions:(CCModeOptions)options cryptor:(CCCryptorRef)cryptor;

- (NSData *)cryptorCommonMethodWihtData:(NSData *)textData MLOperation:(CCOperation)op Algorithm:(CCAlgorithm)alg iv:(const void *)iv key:(const void *)key keySize:(MLKeySize)keySize kCCBlockSize:(MLIvSize)kCCBlockSize;

@end
