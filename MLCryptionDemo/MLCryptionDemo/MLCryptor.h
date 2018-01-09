//
//  MLCryptor.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryptionCommon.h"

@interface MLCryptor : MLCryptionCommon

#pragma mark - 「CBC模式/pkcs7padding填充/Base64输出/utf8编码」加密器初始化方法
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
+ (instancetype)cryptorCommonMethodCBC_PK7WithAlgorithm:(CCAlgorithm)alg key:(NSString *)key keySize:(MLKeySize)keySize iv:(const void *) iv ivMode:(ivMode)ivMode  ivSize:(MLIvSize)ivSize;
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
- (instancetype)initCommonMethodCBC_PK7WithAlgorithm:(CCAlgorithm)alg key:(NSString *)key keySize:(MLKeySize)keySize iv:(const void *)iv ivMode:(ivMode)ivMode  ivSize:(MLIvSize)ivSize;


#pragma mark - 多参数多模式下加密器初始化方法
+ (instancetype)cryptorCommonMethodWithAlgorithm:(CCAlgorithm)alg key:(NSString *)key keySize:(MLKeySize)keySize iv:(const void *) iv ivMode:(ivMode)ivMode  ivSize:(MLIvSize)ivSize;

- (instancetype)initCommonMethodWithAlgorithm:(CCAlgorithm)alg key:(NSString *)key keySize:(MLKeySize)keySize iv:(const void *)iv ivMode:(ivMode)ivMode  ivSize:(MLIvSize)ivSize;


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
