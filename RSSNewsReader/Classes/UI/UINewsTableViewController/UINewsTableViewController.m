//
//  UINewsTableViewController.m
//  RSSNewsReader
//
//  Created by Guest User on 06/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import "UINewsTableViewController.h"

#import "ACNewsArticle.h"
#import "ACNewsDataManager.h"
#import "ACApplicationCore.h"
#import "UINewsArticleTableViewCell.h"
#import "UINewsDetailViewController.h"

#define kCellIdentifier @"newsCell"
#define kEstimatedRowHeight 300.0f
#define kSegueIdentifier @"ShowDetail"

@interface UINewsTableViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation UINewsTableViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Notification methods
- (void)finishedLoading {
    self.dataSource = [[NSArray alloc] initWithArray:[ACApplicationCore sharedInstance].newsDataManager.currentDataSource];
    [self.tableView reloadData];
}

#pragma mark - Setup
- (void)setupDataSource {
    ACNewsArticle *debugArticle = [[ACNewsArticle alloc] initWithTitle:@"News title" descriptionString:@"Description string" link:@"" andImageURL:@""];
    self.dataSource = [[NSArray alloc] initWithObjects:debugArticle, debugArticle, debugArticle, nil];
}

#pragma mark - Other methods
- (void)updateImageForCell:(UINewsArticleTableViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath {
    ACNewsArticle *currentObject = [self.dataSource objectAtIndex:indexPath.row];
    if (currentObject.imageData != nil) {
        [cell decorateWithImage:[UIImage imageWithData:currentObject.imageData]];
    } else {
        __weak UINewsTableViewController *weakSelf = self;
        [[ACApplicationCore sharedInstance].requestManager performGETImageRequestWithURLString:currentObject.imageURL andCompletion:^(NSURL * _Nullable url, NSError * _Nullable error) {
            if (error == nil) {
                currentObject.imageData = [NSData dataWithContentsOfURL:url];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                });
            } else {
                NSLog(@"%@", error);
            }
        }];
    }
}
#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([UINewsArticleTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCellIdentifier];
    self.tableView.estimatedRowHeight = kEstimatedRowHeight;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishedLoading) name:kFinishedLoadingNotificationName object:nil];
    if ([ACApplicationCore sharedInstance].newsDataManager.currentDataSource == nil) {
        [[ACApplicationCore sharedInstance].newsDataManager startLoadingData];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kSegueIdentifier]) {
        UINewsArticleTableViewCell *cell = (UINewsArticleTableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        ACNewsArticle *article = [self.dataSource objectAtIndex:indexPath.row];
        UINewsDetailViewController *destinationViewController = (UINewsDetailViewController *)segue.destinationViewController;
        destinationViewController.article = article;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UINewsArticleTableViewCell *cell = (UINewsArticleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UINewsArticleTableViewCell alloc] init];
    }
    __block ACNewsArticle *currentObject = [self.dataSource objectAtIndex:indexPath.row];
    [cell decorateWithTitle:currentObject.title];
    [self updateImageForCell:cell AtIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UINewsArticleTableViewCell *cell =(UINewsArticleTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:kSegueIdentifier sender:cell];
}

@end
