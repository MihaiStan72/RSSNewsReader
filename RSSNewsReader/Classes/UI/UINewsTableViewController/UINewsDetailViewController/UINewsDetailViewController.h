//
//  UINewsDetailViewController.h
//  RSSNewsReader
//
//  Created by Guest User on 07/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ACNewsArticle.h"

@interface UINewsDetailViewController : UIViewController

@property (nonatomic, strong) ACNewsArticle *article;

@end
