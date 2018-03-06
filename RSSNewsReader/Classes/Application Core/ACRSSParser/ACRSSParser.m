//
//  ACRSSParser.m
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import "ACRSSParser.h"

#import "ACRSSParserConstants.h"

@interface ACRSSParser ()

@property (nonatomic, strong) NSXMLParser *xmlParser;

@property (nonatomic, strong) NSString *item;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *currentElement;

@property (nonatomic, strong) NSMutableDictionary *itemDictionary;
@property (nonatomic, strong) NSMutableArray *itemsArray;

@end

@implementation ACRSSParser


- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:kRSSUrl]];
        self.xmlParser.delegate = self;
        self.itemDictionary = [[NSMutableDictionary alloc] initWithCapacity:0];
        self.itemsArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (void)startParsing {
    [self.xmlParser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString:kItemKey]) {
        self.currentElement = elementName;
        self.item = @"";
    }
    if ([elementName isEqualToString:kTitleKey]) {
        self.currentElement = elementName;
        self.title = @"";
    }
    if ([elementName isEqualToString:kDescriptionKey]) {
        self.currentElement = elementName;
        self.itemDescription = @"";
    }
    if ([elementName isEqualToString:kEnclosureKey]) {
        self.currentElement = elementName;
        self.imageURL = [attributeDict valueForKey:kImageURLAttributeKey];
    }
    if ([elementName isEqualToString:kLinkKey]) {
        self.currentElement = elementName;
        self.link = @"";
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([self.currentElement isEqualToString:kTitleKey]) {
        self.title = [self.title stringByAppendingString:string];
    }
    if ([self.currentElement isEqualToString:kLinkKey]) {
        self.link = [self.link stringByAppendingString:string];
    }
    if ([self.currentElement isEqualToString:kDescriptionKey]) {
        self.itemDescription = [self.itemDescription stringByAppendingString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:kTitleKey]) {
        self.itemDictionary[kTitleKey] = self.title;
    }
    if ([elementName isEqualToString:kLinkKey]) {
        self.itemDictionary[kLinkKey] = self.link;
    }
    if ([elementName isEqualToString:kEnclosureKey]) {
        self.itemDictionary[kImageURLAttributeKey] = self.imageURL;
    }
    if ([elementName isEqualToString:kDescriptionKey]) {
        self.itemDictionary[kDescriptionKey] = self.itemDescription;
    }
    if ([elementName isEqualToString:kItemKey]) {
        [self.itemsArray addObject:self.itemDictionary];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    //TODO POST NOTIFICATION

}
@end
