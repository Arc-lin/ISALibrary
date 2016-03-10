//
//  ISASchoolResult.m
//  ISALibrary
//
//  Created by Arclin on 16/3/7.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import "ISASchoolResult.h"
#import "ISASchoolBook.h"

@implementation ISASchoolResult

+ (NSDictionary *)objectClassInArray{
    return @{@"data":[ISASchoolBook class]};
}

@end
