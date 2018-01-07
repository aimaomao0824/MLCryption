//
//  MLCryptionCommon.h
//  MLCryptionDemo
//
//  Created by MannersLee on 2018/1/7.
//  Copyright © 2018年 开发者MannersLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLCryptionCommon : NSObject

/** MLMode */
@property (nonatomic, assign) uint32_t MLMode;

/** MLPadding */
@property (nonatomic, assign) uint32_t MLPadding;

/** key */
@property (nonatomic, copy) NSString *key;

/** iv */
@property (nonatomic, assign) const void *iv;

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

enum {
    ivString	= 0,
    ivByte		= 1,
};
typedef uint32_t ivMode;

enum {
    /* options for block ciphers */
    kMLOptionPKCS7Padding   = 0x0001,
    kMLOptionECBMode        = 0x0002
    /* stream ciphers currently have no options */
};
typedef uint32_t MLOptions;

@end
