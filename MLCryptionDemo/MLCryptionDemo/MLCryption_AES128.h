//
//  MLCryption_AES128.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/8.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//
/**
 AES128加密—》模式：CBC  ||  填充：pkcs7padding  ||  key密码：16位  ||  iv偏移量：16位  ||  输出：Base64   ||  编码：utf8编码
 ->key密码：超过16位，以前16位为准
 ->iv向量：超过16位，以前16位为准

 */

#import "MLCryptionCommon.h"

@interface MLCryption_AES128 : MLCryptionCommon

# pragma mark - 创建AES128密器
+ (instancetype)cryptionAES128_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWithAES128_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
//
# pragma mark - AES128加密解密方法
/**AES128 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUseAES128_StrToStr:(NSString *)plainText;
- (NSString *)ml_decryptUseAES128_StrToStr:(NSString *)cipherText;
/**AES128 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUseAES128_DataToData:(NSData *)plainText;
- (NSData *)ml_decryptUseAES128_DataToData:(NSData *)cipherText;


@end
