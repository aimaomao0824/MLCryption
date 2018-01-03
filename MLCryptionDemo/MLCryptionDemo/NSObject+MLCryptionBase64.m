//
//  NSObject+MLCryptionBase64.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/3.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "NSObject+MLCryptionBase64.h"
//#import <CommonCrypto/CommonCryptor.h>

@implementation NSObject (MLCryptionBase64)

@end

/**----------------------------------------------------------以下是NSString的分类-------------------------------------------------------------------------*/
#pragma mark - 以下是NSString的分类
@implementation NSString (MLCryptionBase64)
#pragma mark - base64编码
/** 编码--》返回NSString数据 */
- (NSString *)ml_encodeStringUseBase64
{
    return [NSString ml_encodeStringUseBase64:self];
}

+ (NSString *)ml_encodeStringUseBase64:(NSString *)plainString
{
    NSData *data = [plainString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}

/** 编码--》返回NSData数据 */
+ (NSData *)ml_encodeDataUseBase64:(NSString *)plainString
{
    NSData *data = [plainString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedDataWithOptions:0];
}

- (NSData *)ml_encodeDataUseBase64
{
    return [NSString ml_encodeDataUseBase64:self];
}




#pragma mark - base64解码
/** 解码--》返回NSString数据 */
- (NSString *)ml_decodeStringUseBase64
{
    return [NSString ml_decodeStringUseBase64:self];
}

+ (NSString *)ml_decodeStringUseBase64:(NSString *)cipherString
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:cipherString options:0];
    
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}
/** 解码--》返回NSData数据 */
- (NSData *)ml_decodeDataUseBase64
{
    return [NSString ml_decodeDataUseBase64:self];
}

+ (NSData *)ml_decodeDataUseBase64:(NSString *)cipherString
{
    return [[NSData alloc]initWithBase64EncodedString:cipherString options:0];
}

@end




/**----------------------------------------------------------以下是NSData的分类-------------------------------------------------------------------------*/
#pragma mark - 以下是NSData的分类

@implementation NSData (MLCryptionBase64)

#pragma mark - base64编码
/** 编码--》返回NSString数据 */
- (NSString *)ml_encodeStringUseBase64
{
    return [self base64EncodedStringWithOptions:0];
}

+ (NSString *)ml_encodeStringUseBase64:(NSData *)plainData
{
    return [plainData base64EncodedStringWithOptions:0];
}

/** 编码--》返回NSData数据 */
+ (NSData *)ml_encodeDataUseBase64:(NSData *)plainData
{
    return [plainData base64EncodedDataWithOptions:0];
}

- (NSData *)ml_encodeDataUseBase64
{
    return [self base64EncodedDataWithOptions:0];
}




#pragma mark - base64解码
/** 解码--》返回NSString数据 */
- (NSString *)ml_decodeStringUseBase64
{
    return [NSData ml_decodeStringUseBase64:self];
}

+ (NSString *)ml_decodeStringUseBase64:(NSData *)cipherData
{
    NSData *data = [[NSData alloc] initWithBase64EncodedData:cipherData options:0];
    
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}
/** 解码--》返回NSData数据 */
- (NSData *)ml_decodeDataUseBase64
{
    return [NSData ml_decodeDataUseBase64:self];
}

+ (NSData *)ml_decodeDataUseBase64:(NSData *)cipherData
{
    return [[NSData alloc] initWithBase64EncodedData:cipherData options:0];
}

@end
