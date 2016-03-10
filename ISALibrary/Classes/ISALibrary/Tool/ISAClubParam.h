//
//  ISAClubParam.h
//  ISALibrary
//
//  Created by Arclin on 16/3/8.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISAClubParam : NSObject
//http://library.sxisa.com/interface/search.php?s=java&i=0&c=10

/**
 *  搜索关键字
 */
@property (nonatomic,copy) NSString *s;
/**
 *  搜索起始位置
 */
@property (nonatomic,copy) NSString *i;
/**
 *  搜索条数
 */
@property (nonatomic,copy) NSString *c;

@end
