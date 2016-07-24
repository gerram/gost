//
//  Site+CoreDataProperties.m
//  gost
//
//  Created by George Malushkin on 21/07/16.
//  Copyright © 2016 George Malushkin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Site+CoreDataProperties.h"

@implementation Site (CoreDataProperties)

@dynamic site_id;
@dynamic uniq_url;
@dynamic website_url;
@dynamic website_name;
@dynamic govbody_name;
@dynamic w3c_weight;
@dynamic w3c_position;
@dynamic w3c_v_errors;
@dynamic w3c_v_warnings;
@dynamic w3c_v_probedate;
@dynamic last_updated;

@end
