//
//  ISAClubTool.m
//  ISALibrary
//
//  Created by Arclin on 16/3/8.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import "ISAClubTool.h"
#import "ISAClubParam.h"
#import "ISAClubResult.h"
@implementation ISAClubTool

#define ISABaseUrl @"http://library.sxisa.com/interface/search.php"

+ (void)fetchResulyByValue:(NSString *)value fromIndex:(NSString *)index success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    ISAClubParam *param = [[ISAClubParam alloc] init];
    
    param.s = value;
    
    param.i = index;
    
    // 设置搜索显示的数量
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
       NSString *str = [defaults objectForKey:@"Num"];
        param.c = str;
    }else{
        param.c = @"20";
    }
    
    [ISAHttpTool GET:ISABaseUrl parameters:param.keyValues success:^(id responseObject) {
        
        ISAClubResult *result = [ISAClubResult objectWithKeyValues:responseObject];
        if (success) {
            success(result.data);
        }
    } failure:^(NSError *error) {
        if (error) {
            failure(error);
        }
    }];
}

@end
