//
//  ISAClubResult.m
//  ISALibrary
//
//  Created by Arclin on 16/3/8.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import "ISAClubResult.h"
#import "ISAClubBook.h"

@implementation ISAClubResult

+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[ISAClubBook class]};
}
@end
