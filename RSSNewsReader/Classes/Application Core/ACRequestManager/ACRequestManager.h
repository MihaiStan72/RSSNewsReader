//
//  ACRequestManager.h
//  RSSNewsReader
//
//  Created by Guest User on 07/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACRequestManager : NSObject

- (void)performGETImageRequestWithURLString:(NSString *_Nonnull)urlString andCompletion:(void (^ _Nullable)(NSURL * _Nullable url, NSError * _Nullable error))completion;

@end
