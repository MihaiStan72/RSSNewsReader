//
//  ACRSSParser.h
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kRSSUrl @"http://www.lemonde.fr/rss/une.xml"

@interface ACRSSParser : NSObject <NSXMLParserDelegate>

- (void)startParsing;

@end
