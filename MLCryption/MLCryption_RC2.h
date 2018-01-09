//
//  MLCryption_RC2.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/9.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//
/**
 RC2加密—》模式：CBC  ||  填充：pkcs7padding  ||  key密码：128位  ||  iv偏移量：8位  ||  输出：Base64   ||  编码：utf8编码
 ->key密码：超过128位，以前128位为准
 ->iv向量：超过8位，以前8位为准
 
 */

#import "MLCryptionCommon.h"

@interface MLCryption_RC2 : MLCryptionCommon

# pragma mark - 创建RC2密器
+ (instancetype)cryptionRC2_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWithRC2_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
//
# pragma mark - RC2加密解密方法
/**RC2 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUseRC2_StrToStr:(NSString *)plainText;
- (NSString *)ml_decryptUseRC2_StrToStr:(NSString *)cipherText;
/**RC2 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUseRC2_DataToData:(NSData *)plainText;
- (NSData *)ml_decryptUseRC2_DataToData:(NSData *)cipherText;


@end
