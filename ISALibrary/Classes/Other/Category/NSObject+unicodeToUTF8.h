//
//  NSObject+unicodeToUTF8.h
//  ISALibrary
//
//  Created by Arclin on 16/3/7.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (unicodeToUTF8)

+ (NSString *)replaceUnicode:(NSString *)unicodeStr;

@end
