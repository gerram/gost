//
//  Site+CoreDataProperties.h
//  gost
//
//  Created by George Malushkin on 21/07/16.
//  Copyright © 2016 George Malushkin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Site.h"

NS_ASSUME_NONNULL_BEGIN

@interface Site (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *site_id;
@property (nullable, nonatomic, retain) NSString *uniq_url;
@property (nullable, nonatomic, retain) NSString *website_url;
@property (nullable, nonatomic, retain) NSString *website_name;
@property (nullable, nonatomic, retain) NSString *govbody_name;
@property (nullable, nonatomic, retain) NSNumber *w3c_weight;
@property (nullable, nonatomic, retain) NSNumber *w3c_position;
@property (nullable, nonatomic, retain) NSNumber *w3c_v_errors;
@property (nullable, nonatomic, retain) NSNumber *w3c_v_warnings;
@property (nullable, nonatomic, retain) NSDate *w3c_v_probedate;
@property (nullable, nonatomic, retain) NSDate *last_updated;

@end

NS_ASSUME_NONNULL_END
