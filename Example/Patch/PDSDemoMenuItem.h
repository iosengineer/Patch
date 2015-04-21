//
//  PDSDemoMenuItem.h
//  Patch
//
//  Created by Adam Iredale on 21/04/2015.
//  Copyright (c) 2015 Adam Iredale. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Protocols

#import "PDSDemoProtocols.h"

@interface PDSDemoMenuItem : NSObject <PDSDemoMenuItem>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

+ (instancetype)menuItemWithTitle:(NSString *)title subtitle:(NSString *)subtitle;

@end