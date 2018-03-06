//
//  UINewsArticleTableViewCell.m
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import "UINewsArticleTableViewCell.h"

@interface UINewsArticleTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *articleImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation UINewsArticleTableViewCell

#pragma mark - Public methods
- (void)decorateWithTitle:(NSString *)title {
    self.titleLabel.text = title;
    [self.activityIndicator startAnimating];
}

@end
