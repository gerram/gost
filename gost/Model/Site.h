//
//  Site.h
//  gost
//
//  Created by George Malushkin on 21/07/16.
//  Copyright © 2016 George Malushkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Site : NSManagedObject

- (void)loadFromDictionary:(NSDictionary *)dictionary;
+ (Site *)findOrCreateSiteWithID:(NSNumber *)site_id inContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "Site+CoreDataProperties.h"
