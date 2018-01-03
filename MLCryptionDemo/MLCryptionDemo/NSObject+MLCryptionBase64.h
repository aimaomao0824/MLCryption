//
//  NSObject+MLCryptionBase64.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/3.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

/*!
 @header     MLCryption.h
 @abstract   这是一个简单易用的Base64加密类
 
 @discussion Base64编码说明
    Base64编码要求把3个8位字节（3*8=24）转化为4个6位的字节（4*6=24），
 之后在6位的前面补两个0，形成8位一个字节的形式。 如果剩下的字符不足3个字
 节，则用0填充，输出字符使用'='，因此编码后输出的文本末尾可能会出现1或2个'='。
 
 　　为了保证所输出的编码位可读字符，Base64制定了一个编码表，以便进行统一转换
 。编码表的大小为2^6=64，这也是Base64名称的由来。
 */

#import <Foundation/Foundation.h>

@interface NSObject (MLCryptionBase64)

@end

@interface NSString (MLCryptionBase64)

/**
 *  Base64编码
 *
 *  @param plainString 原文
 *
 *  @return 返回密文字符串
 */
+ (NSString *)ml_encodeStringUseBase64:(NSString *)plainString;
- (NSString *)ml_encodeStringUseBase64;
/** 返回NSData数据 */
+ (NSData *)ml_encodeDataUseBase64:(NSString *)plainString;
- (NSData *)ml_encodeDataUseBase64;



/**
 *  Base64解码
 *
 *  @param cipherString 密文
 *
 *  @return 返回原文
 */
+ (NSString *)ml_decodeStringUseBase64:(NSString *)plainString;
- (NSString *)ml_decodeStringUseBase64;
/** 返回NSData数据 */
+ (NSData *)ml_decodeDataUseBase64:(NSString *)plainString;
- (NSData *)ml_decodeDataUseBase64;


@end

@interface NSData (MLCryptionBase64)

/**
 *  Base64编码
 *
 *  @param plainString 原文
 *
 *  @return 返回密文字符串
 */
+ (NSString *)ml_encodeStringUseBase64:(NSData *)plainData;
- (NSString *)ml_encodeStringUseBase64;
/** 返回NSData数据 */
+ (NSData *)ml_encodeDataUseBase64:(NSData *)plainData;
- (NSData *)ml_encodeDataUseBase64;



/**
 *  Base64解码
 *
 *  @param cipherString 密文
 *
 *  @return 返回原文
 */
+ (NSString *)ml_decodeStringUseBase64:(NSData *)plainData;
- (NSString *)ml_decodeStringUseBase64;
/** 返回NSData数据 */
+ (NSData *)ml_decodeDataUseBase64:(NSData *)plainData;
- (NSData *)ml_decodeDataUseBase64;

@end
