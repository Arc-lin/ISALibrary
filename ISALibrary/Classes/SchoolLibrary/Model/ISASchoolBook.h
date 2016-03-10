//
//  ISASchoolBook.h
//  ISALibrary
//
//  Created by Arclin on 16/3/7.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface ISASchoolBook : NSObject

/**
 *  作者
 */
@property (nonatomic,copy) NSString *author;
/**
 *  检索号
 */
@property (nonatomic,copy) NSString *callno;
/**
 *  id编号
 */
@property (nonatomic,copy) NSString *ID;
/**
 *  isbn
 */
@property (nonatomic,copy) NSString *isbn;
/**
 *  页码
 */
@property (nonatomic,copy) NSString *page;
/**
 *  出版社
 */
@property (nonatomic,copy) NSString *press;
/**
 *  价格
 */
@property (nonatomic,copy) NSString *price;
/**
 *  科目
 */
@property (nonatomic,copy) NSString *subject;
/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;
/**
 *  类型
 */
@property (nonatomic,copy) NSString *type;

@end
