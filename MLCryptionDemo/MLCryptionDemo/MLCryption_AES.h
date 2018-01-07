//
//  MLCryption_AES.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryptionCommon.h"

@interface MLCryption_AES : MLCryptionCommon

# pragma mark - 创建AES加密器
+ (instancetype)cryptionAES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWithAES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;

# pragma mark - AES加密解密方法
/** 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUseAES_StrToStr:(NSString *)plainText;
- (NSString *)ml_decryptUseAES_StrToStr:(NSString *)cipherText;
/** 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUseAES_DataToData:(NSData *)plainText;
- (NSData *)ml_decryptUseAES_DataToData:(NSData *)cipherText;


@end
