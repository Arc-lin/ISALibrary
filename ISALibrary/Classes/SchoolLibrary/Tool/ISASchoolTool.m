//
//  ISASchoolTool.m
//  ISALibrary
//
//  Created by Arclin on 16/3/7.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import "ISASchoolTool.h"
#import "ISASchoolParam.h"
#import "ISASchoolBook.h"
#import "ISASchoolResult.h"

#define ISABaseUrl @"http://api.sxisa.com/app/library/search.php"
#define ISAKey @"title"

@implementation ISASchoolTool

+ (void)fetchResulyByValue:(NSString *)value fromIndex:(NSString *)index success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    ISASchoolParam *param = [[ISASchoolParam alloc] init];
    param.k = ISAKey;
    param.i = index;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        NSString *str = [defaults objectForKey:@"Num"];
        param.c = str;
    }else{
        param.c = @"20";
    }
    
    param.v = value;

    [ISAHttpTool GET:ISABaseUrl parameters:param.keyValues success:^(id responseObject) {
        
        // 字典转模型
//        NSLog(@"%@",[responseObject valueForKey:@"data"]);
        ISASchoolResult *result = [ISASchoolResult objectWithKeyValues:responseObject];
        if(success){
            success(result.data);
        }

    } failure:^(NSError *error) {
        if(error){
            failure(error);
        }
    }];

}

@end
