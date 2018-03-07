//
//  ACNewsArticle.m
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import "ACNewsArticle.h"

@implementation ACNewsArticle

- (instancetype)initWithTitle:(NSString *)title descriptionString:(NSString *)descriptionString link:(NSString *)link andImageURL:(NSString *)imageURL {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.descriptionString = descriptionString;
        self.imageURL = imageURL;
        self.link = link;
        self.imageData = nil;
    }
    
    return self;
}

@end
