//
//  GERGostManager.m
//  gost
//
//  Created by George Malushkin on 24/07/16.
//  Copyright © 2016 George Malushkin. All rights reserved.
//

#import "GERGostManager.h"
#import "AFNetworking.h"
#import "Site.h"

@interface GERGostManager ()

@end

@implementation GERGostManager

+ (instancetype)sharedManager {
    static GERGostManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[GERGostManager alloc] init];
    });
    
    return _sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self getBadtop100:nil];
        });
    }
    return self;
}

#pragma mark - Networking

- (void)getBadtop100:(ServerResponceCompletionBlock)completion {
    __weak typeof(self) weakSelf = self;
    
    NSURL *URL = [NSURL URLWithString:@"http://www.govweb.ru/api/v1/ratings/w3c_badtop100/?format=json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
                                         initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [weakSelf insertItemsToStorage:responseObject];
        NSLog(@"Operation with request to site completed normal.");
        if (completion)
        {
            completion();
        }
    }
                                     failure:^(AFHTTPRequestOperation *operation , NSError *error) {
                                         NSLog(@"Operation with request to site not completed properly way.");
                                         if (completion)
                                         {
                                             completion();
                                         }
                                     }];
    [operation start];
}


#pragma mark - Storage

- (void)insertItemsToStorage:(NSArray *)items
{
    if (![[NSThread currentThread] isMainThread])
    {
        [self performSelector:_cmd onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
        return;
    }
    
    for (NSDictionary *item in items)
    {
        NSNumber *site_id = [NSNumber numberWithInteger:[item[@"id"] integerValue]];
        Site *site = [Site findOrCreateSiteWithID:site_id inContext:APPDELEGATE.managedObjectContext];
        [site loadFromDictionary:item];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![APPDELEGATE.managedObjectContext save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
    }
}


@end
