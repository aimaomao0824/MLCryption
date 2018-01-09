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
@property (nonatomic, assign) uint32_t MLMode;

/** MLPadding */
@property (nonatomic, assign) uint32_t MLPadding;

/** key */
@property (nonatomic, copy) NSString *key;

/** iv */
@property (nonatomic, assign) const void *iv;

typedef struct _CCCryptor *CMLryptorRef;



/** MLKeySize */
@property (nonatomic, assign) int keySize;

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
    MLNoPadding			= 0,
    MLPKCS7Padding		= 1,
};
typedef uint32_t MLPadding;

enum {
    ivString	= 0,
    ivByte		= 1,
};
typedef uint32_t ivMode;

enum {
    /* options for block ciphers */
    kMLOptionPKCS7Padding   = 0x0001,
    kMLOptionECBMode        = 0x0002
    /* stream ciphers currently have no options */
};
typedef uint32_t MLOptions;

- (NSData *)test_cryptorCommonMethodWihtData:(NSData *)textData MLOperation:(MLOperation)op MLMode:(MLMode)mode Algorithm:(MLAlgorithm)alg Padding:(CCOptions)padding iv:(const void *)iv key:(const void *)key keySize:(int)keySize tweak:(const void *)tweak tweakLength:(size_t)tweakLength numRounds:(int)numRounds CCModeOptions:(CCModeOptions)options cryptor:(CMLryptorRef)cryptor;
- (NSData *)cryptorCommonMethodWihtData:(NSData *)textData MLOperation:(MLOperation)op Algorithm:(MLAlgorithm)alg iv:(const void *)iv key:(const void *)key keySize:(MLKeySize)keySize kCCBlockSize:(int)kCCBlockSize;

@end
