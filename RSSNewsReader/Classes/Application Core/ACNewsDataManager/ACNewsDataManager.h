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

- (void)startLoadingData;

@end
