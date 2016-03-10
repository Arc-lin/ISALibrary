//
//  ISAHttpTool.h
//  ISALibrary
//
//  Created by Arclin on 16/3/7.
//  Copyright © 2016年 sziit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISAHttpTool : NSObject

/**
 *  发送post请求
 *
 *  @param URLString  请求的基本参数
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
