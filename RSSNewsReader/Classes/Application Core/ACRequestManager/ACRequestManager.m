//
//  ACRequestManager.m
//  RSSNewsReader
//
//  Created by Guest User on 07/03/2018.
//  Copyright © 2018 Guest User. All rights reserved.
//

#import "ACRequestManager.h"

@implementation ACRequestManager


#pragma mark - Public methods
- (void)performGETImageRequestWithURLString:(NSString *)urlString andCompletion:(void (^ _Nullable)(NSURL * _Nullable url, NSError * _Nullable error))completion {
    [ACRequestManager performGETRequestWithURLString:urlString andCompletion:completion];
}

#pragma mark - Private methods
+ (void)performGETRequestWithURLString:(NSString *)urlString andCompletion:(void (^ _Nullable)(NSURL * _Nullable url, NSError * _Nullable error))completion {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    request.URL = [NSURL URLWithString:urlString];
    request.HTTPMethod = @"GET";
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *downloadTask = [urlSession downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completion(location, error);
    }];
    [downloadTask resume];
}

@end
