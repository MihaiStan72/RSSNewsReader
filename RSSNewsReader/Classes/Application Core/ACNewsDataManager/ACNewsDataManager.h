//
//  ACNewsDataManager.h
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kFinishedLoadingNotificationName @"FinishedLoading"

@interface ACNewsDataManager : NSObject

@property (readonly, nonatomic, strong) NSArray *currentDataSource;

- (void)startLoadingData;

@end
