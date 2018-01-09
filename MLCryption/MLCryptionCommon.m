//
//  MLCryptionCommon.m
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import "MLCryptionCommon.h"
//#import <CommonCrypto/CommonCryptor.h>


@implementation MLCryptionCommon

- (NSData *)cryptorCommonMethodWihtData:(NSData *)textData Operation:(CCOperation)op Mode:(CCMode)mode Algorithm:(CCAlgorithm)alg Padding:(CCPadding)padding iv:(const void *)iv key:(const void *)key keySize:(int)keySize tweak:(const void *)tweak tweakLength:(size_t)tweakLength numRounds:(int)numRounds ModeOptions:(CCModeOptions)options cryptor:(CCCryptorRef)cryptor
{
    //1.创建加密器CCCryptorRef
    CCCryptorStatus cryptorStatus = CCCryptorCreateWithMode(op, mode, alg, padding, iv, key, keySize, tweak, tweakLength, numRounds, options, &cryptor);
    if (cryptorStatus!=kCCSuccess) return nil;
    
    size_t bufsize = 0;
    size_t moved = 0;
    size_t total = 0;
    
    //2.获取输出数据的最大长度
    bufsize = CCCryptorGetOutputLength(cryptor, textData.length, true);
    char * buf = (char*)malloc(bufsize);
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
