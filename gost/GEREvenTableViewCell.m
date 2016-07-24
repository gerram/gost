//
//  GEREvenBaseTableViewCell.m
//  gost
//
//  Created by George Malushkin on 21/07/16.
//  Copyright © 2016 George Malushkin. All rights reserved.
//

#import "GEREvenTableViewCell.h"
#import "Site.h"

@implementation GEREvenTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setupWithSite:(Site *)site
{
    self.site_id.text       = [NSString stringWithFormat:@"Site ID: %@", site.site_id];
    self.uniq_url.text      = [NSString stringWithFormat:@"Uniq URL: %@", site.uniq_url];
    self.website_url.text   = [NSString stringWithFormat:@"Website: %@", site.website_url];
    self.website_name.text  = [NSString stringWithFormat:@"Website name: %@", site.website_name];
    self.govbody_name.text  = [NSString stringWithFormat:@"Description: %@", site.govbody_name];
    self.w3c_weight.text    = [NSString stringWithFormat:@"Rate weight: %@", site.w3c_weight];
    self.w3c_position.text  = [NSString stringWithFormat:@"Rate position: %@", site.w3c_position];
    self.w3c_probedate.text = [NSString stringWithFormat:@"Probe date: %@", site.w3c_v_probedate];
    self.last_updated.text  = [NSString stringWithFormat:@"Last update: %@", site.last_updated];
}

@end
