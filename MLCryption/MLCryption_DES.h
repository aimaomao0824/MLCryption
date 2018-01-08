//
//  MLCryption_DES.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//
/**
 DES加密—》模式：CBC  ||  填充：pkcs7padding  ||  key密码：8位  ||  iv偏移量：8位  ||  输出：Base64   ||  编码：utf8编码
 ->key密码：超过8位，以前8位为准
 ->iv向量：超过8位，以前8位为准
 */

#import "MLCryptionCommon.h"

@interface MLCryption_DES : MLCryptionCommon

# pragma mark - 创建DES加密器
+ (instancetype)cryptionDES_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWithDES_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;

# pragma mark - DES加密解密方法
/**3DES 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUseDes_StrToStr:(NSString *)plainText;
- (NSString *)ml_decryptUseDes_StrToStr:(NSString *)cipherText;
/**3DES 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUseDes_DataToData:(NSData *)plainText;
- (NSData *)ml_decryptUseDes_DataToData:(NSData *)cipherText;

@end
