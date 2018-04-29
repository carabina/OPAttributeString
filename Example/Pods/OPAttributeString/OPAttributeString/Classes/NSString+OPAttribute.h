//
//  NSString+OPAttribute.h
//  OPAttributeString
//
//  Created by ooops on 2017/12/15.
//  Copyright © 2017年 张强. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OPAttribute.h"

@interface NSString (OPAttribute)

- (NSMutableAttributedString *)make_Attribute:(void(^)(OPAttribute *make))make;
+ (NSMutableAttributedString *)string:(NSString *)string make_Attribute:(void(^)(OPAttribute *make))make;


@end
