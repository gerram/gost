//
//  Site.m
//  gost
//
//  Created by George Malushkin on 21/07/16.
//  Copyright © 2016 George Malushkin. All rights reserved.
//

#import "Site.h"

@implementation Site

- (void)loadFromDictionary:(NSDictionary *)dictionary
{
    self.site_id = [NSNumber numberWithInteger:[dictionary[@"id"] integerValue]];
    self.uniq_url = dictionary[@"uniq_url"];
    self.website_url = dictionary[@"website_url"];
    self.website_name = dictionary[@"website_name"];
    self.govbody_name = dictionary[@"govbody_name"];
    self.w3c_weight = dictionary[@"w3c_weight"];
    self.w3c_position = dictionary[@"w3c_position"];
    self.w3c_v_errors = dictionary[@"w3c_v_errors"];
    self.w3c_v_warnings = dictionary[@"w3c_v_warnings"];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dictionary[@"w3c_v_probedate"]];
    self.w3c_v_probedate = date;
    self.last_updated = [NSDate date];
}


+ (Site *)findOrCreateSiteWithID:(NSNumber *)site_id inContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Site"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"site_id = %@", site_id];
    
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
    if (error)
    {
        NSLog(@"error: %@", error.localizedDescription);
    }
    if (result.lastObject) {
        return result.lastObject;
    } else {
        Site *site = [NSEntityDescription insertNewObjectForEntityForName:@"Site" inManagedObjectContext:context];
        site.site_id = site_id;
        return site;
    }
}

@end
