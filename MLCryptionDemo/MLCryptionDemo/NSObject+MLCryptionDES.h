//
//  NSObject+MLCryptionDES.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/3.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//
/*!
 @header     MLCryption.h
 @abstract   这是一个简单易用的DES加密类
 
 @discussion DES是一个分组加密算法，它以64位为分组对数据加密。64位一组
 的明文从算法的一端输入，64位的密文从另一段输出。它是一个对称算法：加密和
 解密用的是同一个算法。密钥通常表示为64位的数，但每个第8位都用作奇偶校验，
 可以忽略，所以密钥长度为56位。密钥可以是任意的56位的数，且可在任意的时候改变。
 
     需要注意的是，在iOS中支持DES加密算法是kCCOptionPKCS7Padding
 |kCCOptionECBMode。而在Java端支持的是PKCS5Padding算法。区别在于在使用
 PKCS7Padding，它的密钥可以是8个字节，也可以不是。而Java端必须是8个字节
 */

#import <Foundation/Foundation.h>

@interface NSObject (MLCryptionDES)

@end

@interface NSString (MLCryptionDES)

/**
 *  DES加密方法
 *
 *  @param plainText 原始内容
 *  @param key       加密的key
 *  @param iv        初始化向量iv【如：iv = {1, 2, 3, 4, 5, 6, 7, 8}】
 *
 *  @return 返回加密后的内容
 */
+ (NSString *)ml_encryptUseDes:(NSString *)plainText key:(NSString *)key iv:(const void *)iv;
- (NSString *)ml_encryptUseDesKey:(NSString *)key iv:(const void *)iv;

/**
 *  DES解密方法
 *
 *  @param cipherText 密文
 *  @param key        加密的key
 *  @param iv         初始化向量
 *
 *  @return 返回解密后的内容
 */
+ (NSString *)ml_decryptUseDes:(NSString *)cipherText key:(NSString *)key iv:(const void *)iv;
- (NSString *)ml_decryptUseDesKey:(NSString *)key iv:(const void *)iv;
@end
