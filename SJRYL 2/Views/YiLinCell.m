//
//  YiLinCell.m
//  SJRYL
//
//  Created by MS on 16-2-25.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "YiLinCell.h"
#import "UIImageView+WebCache.h"
#define home @"http://yl.cms.palmtrends.com"

@implementation YiLinCell



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}


-(void)creatUI
{
    
    self.iconView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 70, 70)];
    [self.contentView addSubview:self.iconView];
    
    
    
    self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(90, 10, 200, 20)];

    [self.contentView addSubview:self.titleLabel];
    
    
    self.desLabel=[[UILabel alloc]initWithFrame:CGRectMake(90, 40, 200, 60)];
    self.desLabel.numberOfLines=0;
    
    self.desLabel.font=[UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.desLabel];
    
    
}


-(void)configCellWithModel:(YiLinModel *)model{
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",home,model.icon]]];
    
    
    self.titleLabel.text=model.title;
    
    
    self.desLabel.text=model.des;
    
    
}







@end
