//
//  GERGostManager.h
//  gost
//
//  Created by George Malushkin on 24/07/16.
//  Copyright © 2016 George Malushkin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ServerResponceCompletionBlock)();

@interface GERGostManager : NSObject

+ (instancetype)sharedManager;

- (void)getBadtop100:(ServerResponceCompletionBlock)completion;

@end
