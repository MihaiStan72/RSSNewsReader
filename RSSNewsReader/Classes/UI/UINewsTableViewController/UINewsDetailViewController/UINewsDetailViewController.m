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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
