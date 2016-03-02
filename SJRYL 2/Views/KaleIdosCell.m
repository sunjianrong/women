//
//  KaleIdosCell.m
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "KaleIdosCell.h"
#import "UIImageView+WebCache.h"
#define home @"http://yl.cms.palmtrends.com"
@implementation KaleIdosCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}


-(void)creatUI
{
 
    self.iconView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width-20, 200-20)];
    [self.contentView addSubview:self.iconView];
    
    
    
    self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 160, 200, 20)];
    self.titleLabel.font=[UIFont boldSystemFontOfSize:20];
    self.titleLabel.tintColor=[UIColor redColor];
    [self.contentView addSubview:self.titleLabel];
    
    
    
    
    
}

-(void)configCellWithModel:(KaleIdosModel *)model{
//    
//    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",home,model.icon]]];
    
    self.titleLabel.text=model.title;
    
    
    
}



@end
