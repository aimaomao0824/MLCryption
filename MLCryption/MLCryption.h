//
//  MLCryption.h
//  MLCryptionDemo
//
//  Created by mtapple on 2018/1/5.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLCryption_DES.h"
//#import "MLCryption_3DES.h"
#import "NSObject+MLCryptionBase64.h"

@interface MLCryption : NSObject
//# pragma mark - 创建DES加密器
//+ (instancetype)cryptionDES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
//- (instancetype)initWithDES_Mode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding key:(NSString *)key iv:(const void *)iv ivMode:(ivMode)ivMode;
//
//# pragma mark - DES加密解密方法
///** 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
//- (NSString *)ml_encryptUseDes_StrToStr:(NSString *)plainText;
//- (NSString *)ml_decryptUseDes_StrToStr:(NSString *)cipherText;
///** 输入一个Data数据，返回一个加密/解密后的Data数据 */
//- (NSData *)ml_encryptUseDes_DataToData:(NSData *)plainText;
//- (NSData *)ml_decryptUseDes_DataToData:(NSData *)cipherText;
//
//
//# pragma mark - 3DES加密解密方法
///** 输入一个NSString数据，返回一个加密/解密后的NSString数据 */
//- (NSString *)ml_encryptUse3Des_StrToStr:(NSString *)plainText;
//- (NSString *)ml_decryptUse3Des_StrToStr:(NSString *)cipherText;
///** 输入一个Data数据，返回一个加密/解密后的Data数据 */
//- (NSData *)ml_encryptUse3Des_DataToData:(NSData *)plainText;
//- (NSData *)ml_decryptUse3Des_DataToData:(NSData *)cipherText;

@end
