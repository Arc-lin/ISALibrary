//
//  ISASchoolParam.h
//  ISALibrary
//
//  Created by Arclin on 16/3/7.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISASchoolParam : NSObject
//http://api.sxisa.com/app/library/search.php?k=title&v=java&i=10&c=10

/**
 *  栏位
 */
@property (nonatomic,copy) NSString *k;

/**
 *  书名
 */
@property (nonatomic,copy) NSString *v;

/**
 *  数据起始值
 */
@property (nonatomic,copy) NSString *i;

/**
 *  查询数量
 */
@property (nonatomic,copy) NSString *c;

@end
