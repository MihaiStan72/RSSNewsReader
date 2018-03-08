//
//  UINewsArticleTableViewCell.m
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import "UINewsArticleTableViewCell.h"

#import "ACApplicationCore.h"

@interface UINewsArticleTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *articleImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation UINewsArticleTableViewCell

#pragma mark - Public methods
- (void)decorateWithArticle:(ACNewsArticle *)article {
    self.titleLabel.text = article.title;
    self.articleImageView.alpha = 0;
    if (article.imageData != nil) {
        self.articleImageView.image = [UIImage imageWithData:article.imageData];
        self.articleImageView.alpha = 1;
    } else {
        __weak UINewsArticleTableViewCell *weakSelf = self;
        [[ACApplicationCore sharedInstance].requestManager performGETImageRequestWithURLString:article.imageURL andCompletion:^(NSURL * _Nullable url, NSError * _Nullable error) {
            if (error == nil) {
                article.imageData = [NSData dataWithContentsOfURL:url];
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.articleImageView.image = [UIImage imageWithData:article.imageData];
                    [UIView animateWithDuration:0.2 animations:^{
                        weakSelf.articleImageView.alpha = 1;
                    }];
                });
            } else {
                NSLog(@"%@", error);
            }}];
        }
}

@end
