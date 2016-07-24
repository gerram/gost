//
//  GEREvenTableViewCell.h
//  gost
//
//  Created by George Malushkin on 21/07/16.
//  Copyright © 2016 George Malushkin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Site;

@interface GEREvenTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *site_id;
@property (weak, nonatomic) IBOutlet UILabel *uniq_url;
@property (weak, nonatomic) IBOutlet UILabel *website_url;
@property (weak, nonatomic) IBOutlet UILabel *website_name;
@property (weak, nonatomic) IBOutlet UILabel *govbody_name;
@property (weak, nonatomic) IBOutlet UILabel *w3c_weight;
@property (weak, nonatomic) IBOutlet UILabel *w3c_position;
@property (weak, nonatomic) IBOutlet UILabel *w3c_probedate;
@property (weak, nonatomic) IBOutlet UILabel *last_updated;

- (void)setupWithSite:(Site *)site;

@end
