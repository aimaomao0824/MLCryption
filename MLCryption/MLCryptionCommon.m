//
//  MLCryptionCommon.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryptionCommon.h"
#import <CommonCrypto/CommonCryptor.h>


@implementation MLCryptionCommon
CCCryptorRef cryptor = NULL;
/**
 *  封装的一个多参数的通用的加密解密方法
 *
 *  @param textData    传入数据Data
 *  @param op          加密或解密
 *  @param mode        加密模式，如CBC,EBC等
 *  @param alg         加密方式，如AES,DES等
 *  @param padding     填充方式，如ccPKCS7Padding等
 *  @param iv          加密向量
 *  @param key         加密密钥
 *  @param keySize     密钥长度如，kMLKeySizeAES128等
 *  @param tweak       在XTS模式才有，「其它模式默认为NULL就好」
 *  @param tweakLength 在XTS模式才有，密钥长度tweakLength等于keySize「其它模式默认为0就好」
 *  @param numRounds   圆形的数字密码使用，默认为0就好
 *  @param options     仅在大的存储模式支持，如CTR模式。「其它默认为0」
 *  @param cryptor     CCCryptorRef类型
 *
 *  @return 加密或解密后的数据Data
 */
- (NSData *)cryptorAllParasCommonMethodWihtData:(NSData *)textData Operation:(CCOperation)op Mode:(CCMode)mode Algorithm:(CCAlgorithm)alg Padding:(CCPadding)padding iv:(const void *)iv kCCBlockSize:(MLIvSize)kCCBlockSize key:(const void *)key keySize:(MLKeySize)keySize tweak:(const void *)tweak tweakLength:(MLKeySize)tweakLength numRounds:(int)numRounds ModeOptions:(CCModeOptions)options
{
    //1.创建加密器CCCryptorRef
    CCCryptorStatus cryptorStatus = CCCryptorCreateWithMode(op, mode, alg, padding, iv, key, keySize, tweak, tweakLength, numRounds, options, &cryptor);
    if (cryptorStatus!=kCCSuccess) return nil;
    
    size_t bufsize = 0;
    size_t moved = 0;
    size_t total = 0;
    
    //2.获取输出数据的最大长度
//    bufsize = CCCryptorGetOutputLength(cryptor, textData.length, true);
    bufsize = textData.length + kCCBlockSize;
    char * buf = (char*)malloc(bufsize);//输出outData
    bzero(buf, bufsize);
    
    //3.加密处理
    cryptorStatus = CCCryptorUpdate(cryptor, textData.bytes, textData.length, buf, bufsize, &moved);
    total += moved;
    if (cryptorStatus!=kCCSuccess) return nil;
    
    //4.处理最后的数据块
    cryptorStatus = CCCryptorFinal(cryptor, buf + total, bufsize - total, &moved);
    if (cryptorStatus!=kCCSuccess) return nil;
    total += moved;
    
    //5.释放
    CCCryptorRelease(cryptor);
    NSData * retData = [NSData dataWithBytes:buf length:total];
    free(buf);
    
    return retData;
}

- (NSData *)cryptorCommonMethodWihtData:(NSData *)textData MLOperation:(CCOperation)op Algorithm:(CCAlgorithm)alg iv:(const void *)iv key:(const void *)key keySize:(MLKeySize)keySize kCCBlockSize:(MLIvSize)kCCBlockSize
{
    NSUInteger dataLength = [textData length];
    size_t bufferSize = dataLength + kCCBlockSize;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(op, alg,kCCOptionPKCS7Padding,key, keySize,iv,[textData bytes], textData.length,buffer, bufferSize,&numBytesEncrypted);
    
    NSData *retData = nil;
    if (cryptStatus == kCCSuccess) {
        retData = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
    }
    return retData;
}


@end
