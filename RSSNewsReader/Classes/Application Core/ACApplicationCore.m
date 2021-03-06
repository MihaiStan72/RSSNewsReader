//
//  ACApplicationCore.m
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import "ACApplicationCore.h"

@interface ACApplicationCore ()

@end

@implementation ACApplicationCore

+ (instancetype)sharedInstance {
    static ACApplicationCore *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ACApplicationCore alloc] init];
        sharedInstance.newsDataManager = [[ACNewsDataManager alloc] init];
        sharedInstance.requestManager = [[ACRequestManager alloc] init];
    });
    return sharedInstance;
}

@end
