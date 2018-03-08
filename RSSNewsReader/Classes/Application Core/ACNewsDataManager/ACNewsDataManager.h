//
//  ACNewsDataManager.h
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ACNewsDataManagerDelegate
- (void)finishedFetchingNews:(NSArray *)newsArray;
@end

@interface ACNewsDataManager : NSObject

@property (nonatomic, weak) id<ACNewsDataManagerDelegate> delegate;

- (void)startLoadingData;

@end
