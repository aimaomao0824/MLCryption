//
//  MLCryptor.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryptionCommon.h"

@interface MLCryptor : MLCryptionCommon

#pragma mark - 加密器初始化方法 「CBC模式/pkcs7padding填充/Base64输出/utf8编码」
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
+ (instancetype)cryptorCommonMethodCBC_PK7WithAlgorithm:(MLAlgorithm)alg key:(NSString *)key keySize:(MLKeySize)keySize iv:(const void *)iv ivMode:(ivMode)ivMode  ivSize:(MLIvSize)ivSize;
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
- (instancetype)initCommonMethodCBC_PK7WithAlgorithm:(MLAlgorithm)alg key:(NSString *)key keySize:(MLKeySize)keySize iv:(const void *)iv ivMode:(ivMode)ivMode  ivSize:(MLIvSize)ivSize;


#pragma mark - 多参数多模式下加密器初始化方法
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
+ (instancetype)cryptorCommonMethodWithMode:(MLMode)mode Algorithm:(MLAlgorithm)alg Padding:(MLPadding)padding iv:(const void *)iv  ivSize:(MLIvSize)ivSize ivMode:(ivMode)ivMode key:(NSString *)key keySize:(MLKeySize)keySize tweak:(NSString *)tweak tweakSize:(MLKeySize)tweakSize numRounds:(int)numRounds ModeOptions:(MLModeOptions)options;
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
- (instancetype)initCommonMethodWithMode:(MLMode)mode Algorithm:(MLAlgorithm)alg Padding:(MLPadding)padding iv:(const void *)iv  ivSize:(MLIvSize)ivSize ivMode:(ivMode)ivMode key:(NSString *)key keySize:(MLKeySize)keySize tweak:(NSString *)tweak tweakSize:(MLKeySize)tweakSize numRounds:(int)numRounds ModeOptions:(MLModeOptions)options;


#pragma mark - 加密和解密方法的调用
/** 输入一个Data数据，返回一个加密后的Data数据 */
- (NSData *)ml_encryptCommonMethod_DataToData:(NSData *)plainData;

/** 输入一个加密Data数据，返回一个解密后的Data数据 */
- (NSData *)ml_decryptCommonMethod_DataToData:(NSData *)cipherData;

/** 输入一个NSString数据，返回一个加密后的NSString数据 */
- (NSString *)ml_encryptCommonMethod_StrToStr:(NSString *)plainText;

/** 输入一个加密的NSString数据，返回一个解密后的NSString数据 */
- (NSString *)ml_decryptCommonMethod_StrToStr:(NSString *)cipherText;

@end
