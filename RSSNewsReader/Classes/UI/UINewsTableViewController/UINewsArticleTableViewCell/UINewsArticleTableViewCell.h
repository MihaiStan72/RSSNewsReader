//
//  UINewsArticleTableViewCell.h
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ACNewsArticle.h"

@interface UINewsArticleTableViewCell : UITableViewCell

- (void)decorateWithArticle:(ACNewsArticle *)article;

@end
