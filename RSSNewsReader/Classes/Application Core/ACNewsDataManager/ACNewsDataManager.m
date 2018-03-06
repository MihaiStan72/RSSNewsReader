//
//  ACNewsDataManager.m
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import "ACNewsDataManager.h"

#import "ACRSSParser.h"

@interface ACNewsDataManager () <ACRSSParserDelegate>

@property (nonatomic, strong) ACRSSParser *parser;

@end

@implementation ACNewsDataManager

- (void)startLoadingData {
    self.parser = [[ACRSSParser alloc] init];
    self.parser.delegate = self;
    [self.parser startParsing];
}

- (void)finishedParsingWithResult:(NSArray *)items {
    [[NSNotificationCenter defaultCenter] postNotificationName:kFinishedLoadingNotificationName object:nil];
}
@end
