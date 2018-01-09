//
//  MLCryptor.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryptionCommon.h"

@interface MLCryptor : MLCryptionCommon



# pragma mark - 创建加密器

# pragma mark - DES加密解密方法
// 创建DES加密器
+ (instancetype)cryption_DES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWith_DES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;

/** 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUseDes_StrToStr:(NSString *)plainText;
- (NSString *)ml_decryptUseDes_StrToStr:(NSString *)cipherText;
/** 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUseDes_DataToData:(NSData *)plainData;
- (NSData *)ml_decryptUseDes_DataToData:(NSData *)cipherData;


# pragma mark - 3DES加密解密方法
// 创建3DES加密器
+ (instancetype)cryption_3DES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWith_3DES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;

/** 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUse3Des_StrToStr:(NSString *)plainText;
- (NSString *)ml_decryptUse3Des_StrToStr:(NSString *)cipherText;
/** 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUse3Des_DataToData:(NSData *)plainData;
- (NSData *)ml_decryptUse3Des_DataToData:(NSData *)cipherData;

# pragma mark - AES加密解密方法
// 创建AES加密器
+ (instancetype)cryption_AES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding KeySize:(MLKeySize)keySize key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWith_AES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding KeySize:(MLKeySize)keySize key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;

/**AES 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUseAES_StrToStr:(NSString *)plainText;
- (NSString *)ml_decryptUseAES_StrToStr:(NSString *)cipherText;
/**AES 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUseAES_DataToData:(NSData *)plainData;
- (NSData *)ml_decryptUseAES_DataToData:(NSData *)cipherData;

# pragma mark - CAST加密解密方法
// 创建CAST加密器
+ (instancetype)cryption_CAST_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding KeySize:(MLKeySize)keySize key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWith_CAST_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding KeySize:(MLKeySize)keySize key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;

/**AES 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptUseCAST_StrToStr:(NSString *)plainText;
/**AES 输入一个NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptUseCAST_StrToStr:(NSString *)cipherText;

/**AES 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptUseCAST_DataToData:(NSData *)plainData;
/**AES 输入一个Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptUseCAST_DataToData:(NSData *)cipherData;

@end
