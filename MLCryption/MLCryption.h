//
//  MLCryption.h
//  MLCryptionDemo
//
//  Created by mtapple on 2018/1/5.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+MLCryptionBase64.h"
#import "NSObject+MLCryptionMD5.h"
#import "NSObject+MLCryptionDES.h"
#import "NSObject+MLCryptionAES.h"
#import "NSObject+MLCryptionRSA.h"

@interface MLCryption : NSObject
/** test */
@property (nonatomic, assign) NSUInteger test1 ;

/** MLMode */
@property (nonatomic, assign) uint32_t MLMode;

/** MLPadding */
@property (nonatomic, assign) uint32_t MLPadding;

/** iv */
@property (nonatomic, assign) const void * iv;

/*!
 @enum       Cipher Modes
 @discussion These are the selections available for modes of operation for
 use with block ciphers.  If RC4 is selected as the cipher (a stream
 cipher) the only correct mode is kMLModeRC4.
 
 @constant kMLModeECB - Electronic Code Book Mode.
 @constant kMLModeCBC - Cipher Block Chaining Mode.
 @constant kMLModeCFB - Cipher Feedback Mode.
 @constant kMLModeOFB - Output Feedback Mode.
 @constant kMLModeXTS - XEX-based Tweaked CodeBook Mode.
 @constant kMLModeRC4 - RC4 as a streaming cipher is handled internally as a mode.
 @constant kMLModeCFB8 - Cipher Feedback Mode producing 8 bits per round.
 */

enum {
    kMLModeECB		= 1,
    kMLModeCBC		= 2,
    kMLModeCFB		= 3,
    kMLModeCTR		= 4,
    kMLModeF8		= 5, // Unimplemented for now (not included)
    kMLModeLRW		= 6, // Unimplemented for now (not included)
    kMLModeOFB		= 7,
    kMLModeXTS		= 8,
    kMLModeRC4		= 9,
    kMLModeCFB8		= 10,
};
typedef uint32_t MLMode;

enum {
    MLNoPadding			= 0,
    MLPKCS7Padding		= 1,
};
typedef uint32_t MLPadding;

/*!
 @enum       MLOptions
 @abstract   Options flags, passed to MLCryptorCreate().
 
 @constant   kMLOptionPKCS7Padding   Perform PKCS7 padding.
 @constant   kMLOptionECBMode        Electronic Code Book Mode.
 Default is CBC.
 */
enum {
    /* options for block ciphers */
    kMLOptionPKCS7Padding   = 0x0001,
    kMLOptionECBMode        = 0x0002
    /* stream ciphers currently have no options */
};
typedef uint32_t MLOptions;



+ (instancetype)cryptionDES_MLMode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding iv:(const void *)iv;
- (instancetype)initWithMLMode:(MLMode)MLMode MLPadding:(MLPadding)MLPadding iv:(const void *)iv;

+ (NSString *)ml_encryptUseDes:(NSString *)plainText key:(NSString *)key iv:(const void *)iv;

@end
