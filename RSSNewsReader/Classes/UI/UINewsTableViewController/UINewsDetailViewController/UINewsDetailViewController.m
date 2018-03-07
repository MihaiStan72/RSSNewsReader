//
//  UINewsDetailViewController.m
//  RSSNewsReader
//
//  Created by Guest User on 07/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import "UINewsDetailViewController.h"

@interface UINewsDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *fullArticleButton;

@end

@implementation UINewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.article.title;
    self.descriptionLabel.text = self.article.descriptionString;
    self.imageView.image = [UIImage imageWithData:self.article.imageData];
}
- (IBAction)clickedFullArticleButton:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.article.link] options:@{} completionHandler:nil];
}


@end
