//
//  ISAClubBook.h
//  ISALibrary
//
//  Created by Arclin on 16/3/8.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISAClubBook : NSObject
//ID = 99;
//ISBN = 9787302123156;
//author = "\U8c2d\U6d69\U5f3a";
//dbid = 1731572;
//name = "C++\U9762\U5411\U5bf9\U8c61\U7a0b\U5e8f\U8bbe\U8ba1";
//pages = 288;
//publisher = "\U6e05\U534e\U5927\U5b66\U51fa\U7248\U793e";

/**
 *  ID
 */
@property (nonatomic,copy) NSString *ID;

/**
 *  ISBN
 */

@property (nonatomic,copy) NSString *ISBN;
/**
 *  author
 */
@property (nonatomic,copy) NSString *author;

/**
 *  dbid
 */
@property (nonatomic,copy) NSString *dbid;
/**
 *  name
 */
@property (nonatomic,copy) NSString *name;
/**
 *  pages
 */
@property (nonatomic,copy) NSString *pages;
/**
 *  publisher
 */
@property (nonatomic,copy) NSString *publisher;

@end
