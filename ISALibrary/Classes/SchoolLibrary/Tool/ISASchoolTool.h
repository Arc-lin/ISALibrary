//
//  ISASchoolTool.h
//  ISALibrary
//
//  Created by Arclin on 16/3/7.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISASchoolTool : NSObject

+ (void)fetchResulyByValue:(NSString *)value fromIndex:(NSString *)index success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure;

@end
