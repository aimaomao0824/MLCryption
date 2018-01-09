//
//  MLCryption_Blowfish.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/9.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//
/**
 Blowfish加密—》模式：CBC  ||  填充：pkcs7padding  ||  key密码：56位  ||  iv偏移量：8位  ||  输出：Base64   ||  编码：utf8编码
 ->key密码：超过56位，以前56位为准
 ->iv向量：超过8位，以前8位为准
 
 */

#import "MLCryptionCommon.h"

@interface MLCryption_Blowfish : MLCryptionCommon
# pragma mark - 创建Blowfish密器
+ (instancetype)cryptionBlowfish_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWithBlowfish_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
//
# pragma mark - Blowfish加密解密方法
/**Blowfish 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUseBlowfish_StrToStr:(NSString *)plainText;
- (NSString *)ml_decryptUseBlowfish_StrToStr:(NSString *)cipherText;
/**Blowfish 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUseBlowfish_DataToData:(NSData *)plainText;
- (NSData *)ml_decryptUseBlowfish_DataToData:(NSData *)cipherText;

@end
