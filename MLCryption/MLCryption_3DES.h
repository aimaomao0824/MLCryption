//
//  MLCryption_3DES.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/8.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//
/** 
 3DES加密—》模式：CBC  ||  填充：pkcs7padding  ||  key密码：24位  ||  iv偏移量：8位  ||  输出：Base64   ||  编码：utf8编码
 ->key密码：超过24位，以前24位为准
 ->iv向量：超过8位，以前8位为准

 */

#import "MLCryptionCommon.h"

@interface MLCryption_3DES : MLCryptionCommon

# pragma mark - 创建3DES加密器
+ (instancetype)cryption3DES_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
- (instancetype)initWith3DES_key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
//
# pragma mark - 3DES加密解密方法
/**3DES 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
- (NSString *)ml_encryptUse3DES_StrToStr:(NSString *)plainText;
- (NSString *)ml_decryptUse3DES_StrToStr:(NSString *)cipherText;
/**3DES 输入一个Data数据，返回一个加密/解密后的Data数据 */
- (NSData *)ml_encryptUse3DES_DataToData:(NSData *)plainText;
- (NSData *)ml_decryptUse3DES_DataToData:(NSData *)cipherText;

@end
