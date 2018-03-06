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
#import "UINewsArticleTableViewCell.h"


#define kCellIdentifier @"newsCell"

@interface UINewsTableViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation UINewsTableViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup
- (void)setupDataSource {
    ACNewsArticle *debugArticle = [[ACNewsArticle alloc] initWithTitle:@"News title" descriptionString:@"Description string" andImageURL:@""];
    self.dataSource = [[NSArray alloc] initWithObjects:debugArticle, debugArticle, debugArticle, nil];
}

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([UINewsArticleTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCellIdentifier];
    [self setupDataSource];
}

- (void)viewWillAppear:(BOOL)animated {
    //TODO subscribe to notification and implement data source creation
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UINewsArticleTableViewCell *cell = (UINewsArticleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UINewsArticleTableViewCell alloc] init];
    }
    ACNewsArticle *currentObject = [self.dataSource objectAtIndex:indexPath.row];
    [cell decorateWithTitle:currentObject.title];
    
    return cell;
}

@end
