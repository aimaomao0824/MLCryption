//
//  MLCryption_CAST.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/9.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//
/**
 CAST加密—》模式：CBC  ||  填充：pkcs7padding  ||  key密码：16位  ||  iv偏移量：8位  ||  输出：Base64   ||  编码：utf8编码
 ->key密码：超过16位，以前16位为准
 ->iv向量：超过8位，以前8位为准
 
 */

#import "MLCryptionCommon.h"

@interface MLCryption_CAST : MLCryptionCommon

# pragma mark - 创建CAST密器
+ (instancetype)cryptionCAST_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWithCAST_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
//
# pragma mark - CAST加密解密方法
/**CAST 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUseCAST_StrToStr:(NSString *)plainText;
- (NSString *)ml_decryptUseCAST_StrToStr:(NSString *)cipherText;
/**CAST 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUseCAST_DataToData:(NSData *)plainText;
- (NSData *)ml_decryptUseCAST_DataToData:(NSData *)cipherText;


@end
