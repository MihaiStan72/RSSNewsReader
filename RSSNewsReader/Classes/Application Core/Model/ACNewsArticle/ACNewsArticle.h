//
//  ACNewsArticle.h
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACNewsArticle : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *descriptionString;
@property (nonatomic, strong) NSString *imageURL;

- (instancetype)initWithTitle:(NSString *)title descriptionString:(NSString *)descriptionString andImageURL:(NSString *)imageURL;

@end
