//
//  ACNewsDataManager.m
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import "ACNewsDataManager.h"

#import "ACRSSParser.h"
#import "ACNewsArticle.h"

@interface ACNewsDataManager () <ACRSSParserDelegate>

@property (nonatomic, strong) ACRSSParser *parser;

@end

@implementation ACNewsDataManager

#pragma mark - Public methods
- (void)startLoadingData {
    self.parser = [[ACRSSParser alloc] init];
    self.parser.delegate = self;
    [self.parser startParsing];
}

#pragma mark - Other methods
- (void)createDataSourceArrayWithItems:(NSArray *)items {
    NSMutableArray *dataSourceArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSDictionary *item in items) {
        NSString *title = [item valueForKey:kTitleKey];
        NSString *description = [item valueForKey:kDescriptionKey];
        NSString *link = [item valueForKey:kLinkKey];
        NSString *imageURL = [item valueForKey:kImageURLAttributeKey];
        ACNewsArticle *newsArticle = [[ACNewsArticle alloc] initWithTitle:title descriptionString:description link:link andImageURL:imageURL];
        [dataSourceArray addObject:newsArticle];
    }
    if (self.delegate != nil) {
        [self.delegate finishedFetchingNews:dataSourceArray];
    }
}

#pragma mark - ACRSSParserDelegate methods
- (void)finishedParsingWithResult:(NSArray *)items {
    [self createDataSourceArrayWithItems:items];
}


@end
