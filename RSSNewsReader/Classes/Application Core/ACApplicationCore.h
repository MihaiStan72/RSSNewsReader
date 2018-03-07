//
//  ACApplicationCore.h
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ACNewsDataManager.h"
#import "ACRequestManager.h"

@interface ACApplicationCore : NSObject

@property (nonatomic, strong) ACNewsDataManager *newsDataManager;
@property (nonatomic, strong) ACRequestManager *requestManager;

+ (instancetype)sharedInstance;

@end
